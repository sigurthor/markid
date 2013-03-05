require 'net/http'
require 'open-uri'
require 'rexml/document'
require 'rexml/xpath'

class Bike < ActiveRecord::Base

  include REXML

  mount_uploader :image, PictureUploader
  belongs_to :suspension_type
  belongs_to :number_of_gears
  belongs_to :suspension_type
  belongs_to :brand
  has_many :bike_variants
  has_and_belongs_to_many :bike_types
  attr_accessible :name, :visible, :website, :fork, :bike_type_ids, :brand_id,:image, :image_cache, :image_asset,:remove_image, :group, :suspension_type_id, :number_of_gears_id, :product_attributes, :description, :year

  before_save :get_scott
  after_create :get_scott

  private

  def update_info

  end

  def get_scott

    read = false
    read_size = false
    doc = ''
    size = '<ul>'
    @name = ''
    @image = ''

    open(self.website) do |f|
      lines = f.readlines
      lines.each_with_index do |l,index|
        if l['class="detail-tabs-content specs"'] or read
          if read
            doc << l
          else
            read = true
          end

          if l['</dl>']
            read = false
          end
        end

        if l['<h1 class="page-title">']
          @name = lines[index+1].strip
        end

        if l['div class="grid_15 main-photo"> ']
          h = lines[index+1]
          @image = h[h.index('<a href="')+9...h.index('" id="product-helper1"')]
        end


        if l['ul class="product-sizes">'] or read_size
          if read_size
            size << l
          else
            read_size = true
          end

          if l['</ul>']
            read_size = false
          end
        end

      end
    end

    docx = Document.new doc

    dts = XPath.match docx, "dl/*"

    desc = '<dl>'
    dts.each.with_index do |dt, index|
      desc << "<#{dts[index].name}>#{dts[index].text}</#{dts[index].name}>"
    end
    desc << '</dl>'

    doc_size = Document.new size

    sizes = XPath.match doc_size, "//li"

    sizes.each do |size|
      BikeVariant.find_or_create_by_bike_id_and_size({:size => size.text, :bike_id => self.id})
    end

    self.remote_image_url = @image
    self.name = @name
    self.description = desc
  end

#accepts_nested_attributes_for :bike_types
end
