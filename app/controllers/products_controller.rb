require "csv"

class ProductsController < ApplicationController
  def search
    @ingredient_name = params[:ingredient]
    @selected_source = params[:source]
    @price_min = params[:price_min]
    @price_max = params[:price_max]

    @products = []

    if @ingredient_name.present?
      csv_file = Rails.root.join("db", "products.csv")

      CSV.foreach(csv_file, headers: true, header_converters: :symbol) do |row|
        name = row[:name]
        source = row[:source]
        price = row[:price].to_s.gsub(/[^\d.]/, "").to_f


        next unless name&.downcase&.include?(@ingredient_name.downcase)


        if @selected_source.present? && @selected_source != "all"
          next unless source.downcase == @selected_source.downcase
        end

        # adding price filter
        if @price_min.present?
          next unless price >= @price_min.to_f
        end
        if @price_max.present?
          next unless price <= @price_max.to_f
        end

        @products << {
          name: name,
          price: price,
          source: source
        }
      end

      # adding sorting ability
      if params[:sort] == "desc"
        @products.sort_by! { |p| -p[:price] }
      else
        @products.sort_by! { |p| p[:price] }
      end
    end
  end
end
