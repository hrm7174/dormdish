# hmart_tester.py
import requests
from bs4 import BeautifulSoup
import csv
from datetime import datetime

BASE_URL = "https://hmartdelivery.com/collections/all"
all_products = []

# adding timestamp here so we can see when it was last updated
now = datetime.now().strftime("%Y-%m-%d %H:%M:%S")

page = 1
while True:
    print(f"Scraping page {page}...")
    url = f"{BASE_URL}?page={page}&grid_list=grid-view"
    response = requests.get(url)
    soup = BeautifulSoup(response.text, "html.parser")
    products = soup.select("li.productgrid--item")

    if not products:  # stop if no products
        print("No more products found. Scraping complete.")
        break

    for p in products:
        # Product name
        name_tag = p.select_one(".productitem--title a")
        name = name_tag.get_text(strip=True) if name_tag else "N/A"

        # Product price
        price_tag = p.select_one("[data-price]")
        price = price_tag.get_text(strip=True) if price_tag else "N/A"

        # Availability
        atc_button = p.select_one("button.productitem--action-atc")
        availability = "In Stock" if atc_button and "disabled" not in atc_button.attrs else "Out of Stock"

        # Product URL
        product_url = name_tag["href"] if name_tag else "N/A"

        all_products.append({
            "name": name,
            "price": price,
            "availability": availability,
            "url": product_url,
            "last_scraped": now
        })

    page += 1  # move to next page

print(f"Total products scraped: {len(all_products)}")

# Save products to csv
csv_file = "hmart_items.csv"
with open(csv_file, "w", newline="", encoding="utf-8") as f:
    writer = csv.DictWriter(f, fieldnames=["name", "price", "availability", "url", "last_scraped"])
    writer.writeheader()
    writer.writerows(all_products)

print(f"Saved {len(all_products)} products to {csv_file}")

