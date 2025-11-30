require "csv"

class ProductsController < ApplicationController
  def search
    @ingredient_name = params[:ingredient]
    @products = []

    if @ingredient_name.present?
      csv_file = Rails.root.join("db", "products.csv")

      CSV.foreach(csv_file, headers: true, header_converters: :symbol) do |row|
        if row[:name]&.downcase&.include?(@ingredient_name.downcase)
          @products << {
            name: row[:name],
            price: row[:price].to_s.gsub(/[^\d.]/, "").to_f, # Remove any non-numeric characters
            source: row[:source]
          }
        end
      end

      @products.sort_by! { |p| p[:price] }
    end
  end
end
