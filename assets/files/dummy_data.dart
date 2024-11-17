final List<String> categoryList = [
  "Wooden",
  "Aluminum",
  "Zinc",
  "Steel",
  "Plastic",
];
final Map<String, List<Map<String, dynamic>>> productCategory = {
  "Wooden": woodenProducts,
  "Aluminum": aluminumProducts,
  "Zinc": zincProducts,
  "Steel": steelProducts,
  "Plastic": plasticProducts,
};

final List<Map<String, dynamic>> plasticProducts = [
  {
    "name": "Plastic Storage Bin",
    "subtitle": "Large storage bin",
    "description": "A versatile and durable storage bin made from high-quality plastic.",
    "rating": 4.5,
    "actualPrice": 25.0,
    "discountPrice": 22.5,
    "discountPercentage": 10,
    "paymentOptions": ["Credit Card", "PayPal", "COD"],
    "shopOwner": "HomeStorage",
    "location": "Los Angeles, USA",
    "highlights": [
      "Stackable design",
      "Durable construction",
      "Easy to clean"
    ],
    "image": "https://example.com/images/plastic_storage_bin.jpg"
  },
  {
    "name": "Plastic Water Bottle",
    "subtitle": "BPA-free water bottle",
    "description": "A lightweight and durable water bottle made from plastic.",
    "rating": 4.6,
    "actualPrice": 10.0,
    "discountPrice": 9.0,
    "discountPercentage": 10,
    "paymentOptions": ["Credit Card", "PayPal", "COD"],
    "shopOwner": "EcoDrink",
    "location": "New York, USA",
    "highlights": [
      "BPA-free",
      "Leak-proof design",
      "Dishwasher safe"
    ],
    "image": "https://example.com/images/plastic_water_bottle.jpg"
  },
  {
    "name": "Plastic Garden Chair",
    "subtitle": "Outdoor garden chair",
    "description": "A lightweight and durable garden chair made from plastic.",
    "rating": 4.5,
    "actualPrice": 20.0,
    "discountPrice": 18.0,
    "discountPercentage": 10,
    "paymentOptions": ["Credit Card", "PayPal", "COD"],
    "shopOwner": "GardenComfort",
    "location": "Miami, USA",
    "highlights": [
      "Weather-resistant",
      "Stackable design",
      "Comfortable seating"
    ],
    "image": "https://example.com/images/plastic_garden_chair.jpg"
  },
  {
    "name": "Plastic Food Container",
    "subtitle": "Airtight food container",
    "description": "A set of airtight food containers made from high-quality plastic.",
    "rating": 4.7,
    "actualPrice": 15.0,
    "discountPrice": 13.5,
    "discountPercentage": 10,
    "paymentOptions": ["Credit Card", "PayPal", "COD"],
    "shopOwner": "KitchenEssentials",
    "location": "Chicago, USA",
    "highlights": [
      "Airtight seal",
      "Microwave safe",
      "Dishwasher safe"
    ],
    "image": "https://example.com/images/plastic_food_container.jpg"
  },
  {
    "name": "Plastic Cutting Board",
    "subtitle": "Durable cutting board",
    "description": "A durable and easy-to-clean cutting board made from plastic.",
    "rating": 4.6,
    "actualPrice": 12.0,
    "discountPrice": 10.8,
    "discountPercentage": 10,
    "paymentOptions": ["Credit Card", "PayPal", "COD"],
    "shopOwner": "KitchenPro",
    "location": "Los Angeles, USA",
    "highlights": [
      "Non-slip base",
      "Dishwasher safe",
      "Knife-friendly surface"
    ],
    "image": "https://example.com/images/plastic_cutting_board.jpg"
  },
  {
    "name": "Plastic Storage Drawer",
    "subtitle": "Multi-purpose storage drawer",
    "description": "A multi-purpose storage drawer made from durable plastic.",
    "rating": 4.5,
    "actualPrice": 30.0,
    "discountPrice": 27.0,
    "discountPercentage": 10,
    "paymentOptions": ["Credit Card", "PayPal", "COD"],
    "shopOwner": "HomeStorage",
    "location": "San Francisco, USA",
    "highlights": [
      "Stackable design",
      "Durable construction",
      "Easy to clean"
    ],
    "image": "https://example.com/images/plastic_storage_drawer.jpg"
  },
  {
    "name": "Plastic Hangers",
    "subtitle": "Durable hangers",
    "description": "A set of durable and lightweight hangers made from plastic.",
    "rating": 4.6,
    "actualPrice": 10.0,
    "discountPrice": 9.0,
    "discountPercentage": 10,
    "paymentOptions": ["Credit Card", "PayPal", "COD"],
    "shopOwner": "ClosetPro",
    "location": "Boston, USA",
    "highlights": [
      "Non-slip design",
      "Durable construction",
      "Lightweight"
    ],
    "image": "https://example.com/images/plastic_hangers.jpg"
  },
  {
    "name": "Plastic Shoe Rack",
    "subtitle": "Compact shoe rack",
    "description": "A compact and durable shoe rack made from plastic.",
    "rating": 4.5,
    "actualPrice": 20.0,
    "discountPrice": 18.0,
    "discountPercentage": 10,
    "paymentOptions": ["Credit Card", "PayPal", "COD"],
    "shopOwner": "ShoeStorage",
    "location": "Miami, USA",
    "highlights": [
      "Compact design",
      "Durable construction",
      "Easy to assemble"
    ],
    "image": "https://example.com/images/plastic_shoe_rack.jpg"
  },
  {
    "name": "Plastic Laundry Basket",
    "subtitle": "Large laundry basket",
    "description": "A large and durable laundry basket made from plastic.",
    "rating": 4.6,
    "actualPrice": 15.0,
    "discountPrice": 13.5,
    "discountPercentage": 10,
    "paymentOptions": ["Credit Card", "PayPal", "COD"],
    "shopOwner": "LaundryPro",
    "location": "Houston, USA",
    "highlights": [
      "Large capacity",
      "Durable construction",
      "Easy to carry"
    ],
    "image": "https://example.com/images/plastic_laundry_basket.jpg"
  },
  {
    "name": "Plastic Desk Organizer",
    "subtitle": "Multi-purpose desk organizer",
    "description": "A multi-purpose desk organizer made from durable plastic.",
    "rating": 4.7,
    "actualPrice": 10.0,
    "discountPrice": 9.0,
    "discountPercentage": 10,
    "paymentOptions": ["Credit Card", "PayPal", "COD"],
    "shopOwner": "OfficePro",
    "location": "Phoenix, USA",
    "highlights": [
      "Multiple compartments",
      "Durable construction",
      "Easy to clean"
    ],
    "image": "https://example.com/images/plastic_desk_organizer.jpg"
  }
];


final List<Map<String, dynamic>> steelProducts = [
  {
    "name": "Steel Kitchen Knife",
    "subtitle": "Professional chef's knife",
    "description": "A sharp and durable kitchen knife made from high-quality steel.",
    "rating": 4.8,
    "actualPrice": 50.0,
    "discountPrice": 45.0,
    "discountPercentage": 10,
    "paymentOptions": ["Credit Card", "PayPal", "COD"],
    "shopOwner": "ChefTools",
    "location": "San Francisco, USA",
    "highlights": [
      "Razor-sharp blade",
      "Ergonomic handle",
      "Rust-resistant"
    ],
    "image": "https://example.com/images/steel_kitchen_knife.jpg"
  },
  {
    "name": "Steel Water Bottle",
    "subtitle": "Insulated water bottle",
    "description": "A durable and insulated water bottle made from steel.",
    "rating": 4.7,
    "actualPrice": 25.0,
    "discountPrice": 22.5,
    "discountPercentage": 10,
    "paymentOptions": ["Credit Card", "PayPal", "COD"],
    "shopOwner": "EcoDrink",
    "location": "New York, USA",
    "highlights": [
      "BPA-free",
      "Leak-proof design",
      "Keeps drinks cold for 24 hours"
    ],
    "image": "https://example.com/images/steel_water_bottle.jpg"
  },
  {
    "name": "Steel Cookware Set",
    "subtitle": "Non-stick cookware set",
    "description": "A complete set of non-stick cookware made from steel.",
    "rating": 4.8,
    "actualPrice": 120.0,
    "discountPrice": 108.0,
    "discountPercentage": 10,
    "paymentOptions": ["Credit Card", "PayPal", "COD"],
    "shopOwner": "KitchenPro",
    "location": "Los Angeles, USA",
    "highlights": [
      "Non-stick coating",
      "Heat-resistant handles",
      "Dishwasher safe"
    ],
    "image": "https://example.com/images/steel_cookware_set.jpg"
  },
  {
    "name": "Steel Garden Tools",
    "subtitle": "Durable garden tools",
    "description": "A set of durable garden tools made from high-quality steel.",
    "rating": 4.6,
    "actualPrice": 35.0,
    "discountPrice": 31.5,
    "discountPercentage": 10,
    "paymentOptions": ["Credit Card", "PayPal", "COD"],
    "shopOwner": "GardenPro",
    "location": "Chicago, USA",
    "highlights": [
      "Rust-resistant",
      "Ergonomic handles",
      "Durable construction"
    ],
    "image": "https://example.com/images/steel_garden_tools.jpg"
  },
  {
    "name": "Steel Coffee Mug",
    "subtitle": "Insulated coffee mug",
    "description": "A double-walled insulated coffee mug made from steel.",
    "rating": 4.7,
    "actualPrice": 20.0,
    "discountPrice": 18.0,
    "discountPercentage": 10,
    "paymentOptions": ["Credit Card", "PayPal", "COD"],
    "shopOwner": "CoffeeLovers",
    "location": "Boston, USA",
    "highlights": [
      "Keeps drinks hot or cold",
      "Leak-proof lid",
      "Easy to clean"
    ],
    "image": "https://example.com/images/steel_coffee_mug.jpg"
  },
  {
    "name": "Steel Bike Frame",
    "subtitle": "Durable bike frame",
    "description": "A strong and durable bike frame made from steel.",
    "rating": 4.8,
    "actualPrice": 250.0,
    "discountPrice": 225.0,
    "discountPercentage": 10,
    "paymentOptions": ["Credit Card", "PayPal", "COD"],
    "shopOwner": "CyclePro",
    "location": "Denver, USA",
    "highlights": [
      "Durable construction",
      "Lightweight design",
      "Easy to assemble"
    ],
    "image": "https://example.com/images/steel_bike_frame.jpg"
  },
  {
    "name": "Steel Tool Box",
    "subtitle": "Portable tool box",
    "description": "A portable and durable tool box made from steel.",
    "rating": 4.6,
    "actualPrice": 45.0,
    "discountPrice": 40.5,
    "discountPercentage": 10,
    "paymentOptions": ["Credit Card", "PayPal", "COD"],
    "shopOwner": "ToolMaster",
    "location": "Houston, USA",
    "highlights": [
      "Lightweight and portable",
      "Multiple compartments",
      "Durable construction"
    ],
    "image": "https://example.com/images/steel_tool_box.jpg"
  },
  {
    "name": "Steel Patio Table",
    "subtitle": "Outdoor patio table",
    "description": "A stylish and durable patio table made from steel.",
    "rating": 4.7,
    "actualPrice": 120.0,
    "discountPrice": 108.0,
    "discountPercentage": 10,
    "paymentOptions": ["Credit Card", "PayPal", "COD"],
    "shopOwner": "PatioPerfect",
    "location": "Phoenix, USA",
    "highlights": [
      "Weather-resistant",
      "Easy to assemble",
      "Modern design"
    ],
    "image": "https://example.com/images/steel_patio_table.jpg"
  },
  {
    "name": "Steel Wall Clock",
    "subtitle": "Modern wall clock",
    "description": "A stylish and modern wall clock made from steel.",
    "rating": 4.5,
    "actualPrice": 30.0,
    "discountPrice": 27.0,
    "discountPercentage": 10,
    "paymentOptions": ["Credit Card", "PayPal", "COD"],
    "shopOwner": "TimeMasters",
    "location": "Miami, USA",
    "highlights": [
      "Modern design",
      "Durable construction",
      "Easy to mount"
    ],
    "image": "https://example.com/images/steel_wall_clock.jpg"
  },
  {
    "name": "Steel Bookends",
    "subtitle": "Stylish bookends",
    "description": "A pair of stylish and durable bookends made from steel.",
    "rating": 4.6,
    "actualPrice": 15.0,
    "discountPrice": 13.5,
    "discountPercentage": 10,
    "paymentOptions": ["Credit Card", "PayPal", "COD"],
    "shopOwner": "BookLovers",
    "location": "San Diego, USA",
    "highlights": [
      "Modern design",
      "Durable construction",
      "Non-slip base"
    ],
    "image": "https://example.com/images/steel_bookends.jpg"
  }
];


final List<Map<String, dynamic>> zincProducts = [
  {
    "name": "Zinc Roof Panel",
    "subtitle": "Durable roof panel",
    "description": "A high-quality zinc roof panel for long-lasting protection.",
    "rating": 4.7,
    "actualPrice": 150.0,
    "discountPrice": 135.0,
    "discountPercentage": 10,
    "paymentOptions": ["Credit Card", "PayPal", "COD"],
    "shopOwner": "RoofGuard",
    "location": "Chicago, USA",
    "highlights": [
      "Corrosion-resistant",
      "Easy to install",
      "Energy-efficient"
    ],
    "image": "https://example.com/images/zinc_roof_panel.jpg"
  },
  {
    "name": "Zinc Garden Planter",
    "subtitle": "Stylish garden planter",
    "description": "A durable and stylish garden planter made from zinc.",
    "rating": 4.6,
    "actualPrice": 40.0,
    "discountPrice": 36.0,
    "discountPercentage": 10,
    "paymentOptions": ["Credit Card", "PayPal", "COD"],
    "shopOwner": "GardenStyle",
    "location": "New York, USA",
    "highlights": [
      "Weather-resistant",
      "Modern design",
      "Lightweight"
    ],
    "image": "https://example.com/images/zinc_garden_planter.jpg"
  },
  {
    "name": "Zinc Alloy Door Handle",
    "subtitle": "Durable door handle",
    "description": "A stylish and durable door handle made from zinc alloy.",
    "rating": 4.8,
    "actualPrice": 25.0,
    "discountPrice": 22.5,
    "discountPercentage": 10,
    "paymentOptions": ["Credit Card", "PayPal", "COD"],
    "shopOwner": "HomeSecure",
    "location": "Los Angeles, USA",
    "highlights": [
      "Corrosion-resistant",
      "Easy to install",
      "Modern design"
    ],
    "image": "https://example.com/images/zinc_alloy_door_handle.jpg"
  },
  {
    "name": "Zinc Coated Screws",
    "subtitle": "High-strength screws",
    "description": "A pack of high-strength screws with zinc coating.",
    "rating": 4.5,
    "actualPrice": 10.0,
    "discountPrice": 9.0,
    "discountPercentage": 10,
    "paymentOptions": ["Credit Card", "PayPal", "COD"],
    "shopOwner": "FixIt",
    "location": "Houston, USA",
    "highlights": [
      "Corrosion-resistant",
      "High tensile strength",
      "Easy to use"
    ],
    "image": "https://example.com/images/zinc_coated_screws.jpg"
  },
  {
    "name": "Zinc Alloy Keychain",
    "subtitle": "Stylish keychain",
    "description": "A stylish and durable keychain made from zinc alloy.",
    "rating": 4.6,
    "actualPrice": 5.0,
    "discountPrice": 4.5,
    "discountPercentage": 10,
    "paymentOptions": ["Credit Card", "PayPal", "COD"],
    "shopOwner": "KeyMasters",
    "location": "Miami, USA",
    "highlights": [
      "Durable construction",
      "Modern design",
      "Lightweight"
    ],
    "image": "https://example.com/images/zinc_alloy_keychain.jpg"
  },
  {
    "name": "Zinc Coated Nails",
    "subtitle": "High-strength nails",
    "description": "A pack of high-strength nails with zinc coating.",
    "rating": 4.7,
    "actualPrice": 8.0,
    "discountPrice": 7.2,
    "discountPercentage": 10,
    "paymentOptions": ["Credit Card", "PayPal", "COD"],
    "shopOwner": "NailIt",
    "location": "Dallas, USA",
    "highlights": [
      "Corrosion-resistant",
      "High tensile strength",
      "Easy to use"
    ],
    "image": "https://example.com/images/zinc_coated_nails.jpg"
  },
  {
    "name": "Zinc Alloy Padlock",
    "subtitle": "Secure padlock",
    "description": "A secure and durable padlock made from zinc alloy.",
    "rating": 4.8,
    "actualPrice": 15.0,
    "discountPrice": 13.5,
    "discountPercentage": 10,
    "paymentOptions": ["Credit Card", "PayPal", "COD"],
    "shopOwner": "LockSafe",
    "location": "San Francisco, USA",
    "highlights": [
      "Corrosion-resistant",
      "High security",
      "Durable construction"
    ],
    "image": "https://example.com/images/zinc_alloy_padlock.jpg"
  },
  {
    "name": "Zinc Alloy Faucet",
    "subtitle": "Durable faucet",
    "description": "A stylish and durable faucet made from zinc alloy.",
    "rating": 4.7,
    "actualPrice": 50.0,
    "discountPrice": 45.0,
    "discountPercentage": 10,
    "paymentOptions": ["Credit Card", "PayPal", "COD"],
    "shopOwner": "WaterFlow",
    "location": "Boston, USA",
    "highlights": [
      "Corrosion-resistant",
      "Modern design",
      "Easy to install"
    ],
    "image": "https://example.com/images/zinc_alloy_faucet.jpg"
  },
  {
    "name": "Zinc Alloy Hinge",
    "subtitle": "Durable hinge",
    "description": "A high-quality hinge made from zinc alloy.",
    "rating": 4.6,
    "actualPrice": 10.0,
    "discountPrice": 9.0,
    "discountPercentage": 10,
    "paymentOptions": ["Credit Card", "PayPal", "COD"],
    "shopOwner": "HingeMasters",
    "location": "Phoenix, USA",
    "highlights": [
      "Corrosion-resistant",
      "Durable construction",
      "Easy to install"
    ],
    "image": "https://example.com/images/zinc_alloy_hinge.jpg"
  },
  {
    "name": "Zinc Alloy Hook",
    "subtitle": "Stylish hook",
    "description": "A stylish and durable hook made from zinc alloy.",
    "rating": 4.5,
    "actualPrice": 5.0,
    "discountPrice": 4.5,
    "discountPercentage": 10,
    "paymentOptions": ["Credit Card", "PayPal", "COD"],
    "shopOwner": "HookIt",
    "location": "Denver, USA",
    "highlights": [
      "Corrosion-resistant",
      "Modern design",
      "Easy to install"
    ],
    "image": "https://example.com/images/zinc_alloy_hook.jpg"
  }
];


final List<Map<String, dynamic>> aluminumProducts = [
  {
    "name": "Aluminum Water Bottle",
    "subtitle": "Eco-friendly water bottle",
    "description": "A lightweight and durable water bottle made from aluminum.",
    "rating": 4.6,
    "actualPrice": 20.0,
    "discountPrice": 18.0,
    "discountPercentage": 10,
    "paymentOptions": ["Credit Card", "PayPal", "COD"],
    "shopOwner": "EcoDrink",
    "location": "New York, USA",
    "highlights": [
      "BPA-free",
      "Leak-proof design",
      "Keeps drinks cold for 24 hours"
    ],
    "image": "https://example.com/images/aluminum_water_bottle.jpg"
  },
  {
    "name": "Aluminum Laptop Stand",
    "subtitle": "Adjustable laptop stand",
    "description": "A sturdy and adjustable laptop stand made from aluminum.",
    "rating": 4.7,
    "actualPrice": 30.0,
    "discountPrice": 27.0,
    "discountPercentage": 10,
    "paymentOptions": ["Credit Card", "PayPal", "COD"],
    "shopOwner": "TechGear",
    "location": "San Francisco, USA",
    "highlights": [
      "Ergonomic design",
      "Lightweight and portable",
      "Non-slip base"
    ],
    "image": "https://example.com/images/aluminum_laptop_stand.jpg"
  },
  {
    "name": "Aluminum Cookware Set",
    "subtitle": "Non-stick cookware set",
    "description": "A complete set of non-stick cookware made from aluminum.",
    "rating": 4.8,
    "actualPrice": 100.0,
    "discountPrice": 90.0,
    "discountPercentage": 10,
    "paymentOptions": ["Credit Card", "PayPal", "COD"],
    "shopOwner": "KitchenPro",
    "location": "Los Angeles, USA",
    "highlights": [
      "Non-stick coating",
      "Heat-resistant handles",
      "Dishwasher safe"
    ],
    "image": "https://example.com/images/aluminum_cookware_set.jpg"
  },
  {
    "name": "Aluminum Flashlight",
    "subtitle": "High-power flashlight",
    "description": "A durable and high-power flashlight made from aluminum.",
    "rating": 4.5,
    "actualPrice": 25.0,
    "discountPrice": 22.5,
    "discountPercentage": 10,
    "paymentOptions": ["Credit Card", "PayPal", "COD"],
    "shopOwner": "LightHouse",
    "location": "Seattle, USA",
    "highlights": ["Water-resistant", "Long battery life", "Adjustable focus"],
    "image": "https://example.com/images/aluminum_flashlight.jpg"
  },
  {
    "name": "Aluminum Picture Frame",
    "subtitle": "Stylish picture frame",
    "description": "A sleek and stylish picture frame made from aluminum.",
    "rating": 4.4,
    "actualPrice": 15.0,
    "discountPrice": 13.5,
    "discountPercentage": 10,
    "paymentOptions": ["Credit Card", "PayPal", "COD"],
    "shopOwner": "FrameIt",
    "location": "Chicago, USA",
    "highlights": ["Modern design", "Durable construction", "Easy to mount"],
    "image": "https://example.com/images/aluminum_picture_frame.jpg"
  },
  {
    "name": "Aluminum Travel Mug",
    "subtitle": "Insulated travel mug",
    "description": "A double-walled insulated travel mug made from aluminum.",
    "rating": 4.6,
    "actualPrice": 20.0,
    "discountPrice": 18.0,
    "discountPercentage": 10,
    "paymentOptions": ["Credit Card", "PayPal", "COD"],
    "shopOwner": "TravelMates",
    "location": "Boston, USA",
    "highlights": [
      "Keeps drinks hot or cold",
      "Leak-proof lid",
      "Easy to clean"
    ],
    "image": "https://example.com/images/aluminum_travel_mug.jpg"
  },
  {
    "name": "Aluminum Garden Chair",
    "subtitle": "Outdoor garden chair",
    "description": "A lightweight and durable garden chair made from aluminum.",
    "rating": 4.7,
    "actualPrice": 50.0,
    "discountPrice": 45.0,
    "discountPercentage": 10,
    "paymentOptions": ["Credit Card", "PayPal", "COD"],
    "shopOwner": "GardenComfort",
    "location": "Miami, USA",
    "highlights": [
      "Weather-resistant",
      "Foldable design",
      "Comfortable seating"
    ],
    "image": "https://example.com/images/aluminum_garden_chair.jpg"
  },
  {
    "name": "Aluminum Bike Frame",
    "subtitle": "Lightweight bike frame",
    "description": "A strong and lightweight bike frame made from aluminum.",
    "rating": 4.8,
    "actualPrice": 200.0,
    "discountPrice": 180.0,
    "discountPercentage": 10,
    "paymentOptions": ["Credit Card", "PayPal", "COD"],
    "shopOwner": "CyclePro",
    "location": "Denver, USA",
    "highlights": [
      "Lightweight design",
      "Durable construction",
      "Easy to assemble"
    ],
    "image": "https://example.com/images/aluminum_bike_frame.jpg"
  },
  {
    "name": "Aluminum Tool Box",
    "subtitle": "Portable tool box",
    "description": "A portable and durable tool box made from aluminum.",
    "rating": 4.6,
    "actualPrice": 40.0,
    "discountPrice": 36.0,
    "discountPercentage": 10,
    "paymentOptions": ["Credit Card", "PayPal", "COD"],
    "shopOwner": "ToolMaster",
    "location": "Houston, USA",
    "highlights": [
      "Lightweight and portable",
      "Multiple compartments",
      "Durable construction"
    ],
    "image": "https://example.com/images/aluminum_tool_box.jpg"
  },
  {
    "name": "Aluminum Patio Table",
    "subtitle": "Outdoor patio table",
    "description": "A stylish and durable patio table made from aluminum.",
    "rating": 4.7,
    "actualPrice": 100.0,
    "discountPrice": 90.0,
    "discountPercentage": 10,
    "paymentOptions": ["Credit Card", "PayPal", "COD"],
    "shopOwner": "PatioPerfect",
    "location": "Phoenix, USA",
    "highlights": ["Weather-resistant", "Easy to assemble", "Modern design"],
    "image": "https://example.com/images/aluminum_patio_table.jpg"
  }
];

final List<Map<String, dynamic>> woodenProducts = [
  {
    "name": "Oak Dining Table",
    "subtitle": "Solid wood dining table",
    "description": "A durable and spacious dining table made of oak wood.",
    "rating": 4.5,
    "actualPrice": 500.0,
    "discountPrice": 450.0,
    "discountPercentage": 10,
    "paymentOptions": ["Credit Card", "PayPal", "COD"],
    "shopOwner": "WoodMasters",
    "location": "California, USA",
    "highlights": [
      "100% solid oak wood",
      "Scratch-resistant surface",
      "Seats up to 8 people"
    ],
    "image": "https://example.com/images/oak_dining_table.jpg"
  },
  {
    "name": "Walnut Bookshelf",
    "subtitle": "5-tier wooden bookshelf",
    "description": "Elegant and sturdy bookshelf with walnut finish.",
    "rating": 4.7,
    "actualPrice": 320.0,
    "discountPrice": 288.0,
    "discountPercentage": 10,
    "paymentOptions": ["Credit Card", "PayPal", "EMI"],
    "shopOwner": "TimberCraft",
    "location": "New York, USA",
    "highlights": [
      "5 shelves for ample storage",
      "Easy to assemble",
      "Smooth walnut finish"
    ],
    "image": "https://example.com/images/walnut_bookshelf.jpg"
  },
  {
    "name": "Teak Coffee Table",
    "subtitle": "Compact wooden coffee table",
    "description":
        "A beautifully crafted coffee table made from high-quality teak wood.",
    "rating": 4.6,
    "actualPrice": 250.0,
    "discountPrice": 225.0,
    "discountPercentage": 10,
    "paymentOptions": ["Credit Card", "PayPal", "Wallet"],
    "shopOwner": "WoodHaven",
    "location": "Dallas, USA",
    "highlights": [
      "Natural teak wood",
      "Compact design for small spaces",
      "Water-resistant finish"
    ],
    "image": "https://example.com/images/teak_coffee_table.jpg"
  },
  {
    "name": "Maple Bed Frame",
    "subtitle": "Queen size bed frame",
    "description": "Sturdy and stylish bed frame made from maple wood.",
    "rating": 4.8,
    "actualPrice": 600.0,
    "discountPrice": 540.0,
    "discountPercentage": 10,
    "paymentOptions": ["Credit Card", "PayPal", "COD"],
    "shopOwner": "SleepWell",
    "location": "Chicago, USA",
    "highlights": ["Solid maple wood", "Easy to assemble", "Modern design"],
    "image": "https://example.com/images/maple_bed_frame.jpg"
  },
  {
    "name": "Cherry Wood Desk",
    "subtitle": "Executive office desk",
    "description": "Elegant and spacious desk made from cherry wood.",
    "rating": 4.9,
    "actualPrice": 700.0,
    "discountPrice": 630.0,
    "discountPercentage": 10,
    "paymentOptions": ["Credit Card", "PayPal", "EMI"],
    "shopOwner": "OfficePro",
    "location": "Seattle, USA",
    "highlights": [
      "Premium cherry wood",
      "Ample storage space",
      "Scratch-resistant surface"
    ],
    "image": "https://example.com/images/cherry_wood_desk.jpg"
  },
  {
    "name": "Pine Wardrobe",
    "subtitle": "Spacious wooden wardrobe",
    "description": "A large wardrobe made from high-quality pine wood.",
    "rating": 4.4,
    "actualPrice": 800.0,
    "discountPrice": 720.0,
    "discountPercentage": 10,
    "paymentOptions": ["Credit Card", "PayPal", "COD"],
    "shopOwner": "HomeEssentials",
    "location": "Boston, USA",
    "highlights": [
      "Solid pine wood",
      "Multiple compartments",
      "Durable construction"
    ],
    "image": "https://example.com/images/pine_wardrobe.jpg"
  },
  {
    "name": "Mahogany TV Stand",
    "subtitle": "Wooden TV stand",
    "description": "A stylish TV stand made from mahogany wood.",
    "rating": 4.6,
    "actualPrice": 350.0,
    "discountPrice": 315.0,
    "discountPercentage": 10,
    "paymentOptions": ["Credit Card", "PayPal", "Wallet"],
    "shopOwner": "LivingSpaces",
    "location": "San Francisco, USA",
    "highlights": [
      "Solid mahogany wood",
      "Cable management system",
      "Modern design"
    ],
    "image": "https://example.com/images/mahogany_tv_stand.jpg"
  },
  {
    "name": "Birch Nightstand",
    "subtitle": "Wooden nightstand",
    "description": "A compact and elegant nightstand made from birch wood.",
    "rating": 4.5,
    "actualPrice": 150.0,
    "discountPrice": 135.0,
    "discountPercentage": 10,
    "paymentOptions": ["Credit Card", "PayPal", "COD"],
    "shopOwner": "BedsideComfort",
    "location": "Miami, USA",
    "highlights": ["Solid birch wood", "Compact design", "Easy to assemble"],
    "image": "https://example.com/images/birch_nightstand.jpg"
  },
  {
    "name": "Cedar Chest",
    "subtitle": "Wooden storage chest",
    "description": "A spacious storage chest made from cedar wood.",
    "rating": 4.7,
    "actualPrice": 400.0,
    "discountPrice": 360.0,
    "discountPercentage": 10,
    "paymentOptions": ["Credit Card", "PayPal", "EMI"],
    "shopOwner": "StorageSolutions",
    "location": "Denver, USA",
    "highlights": [
      "Solid cedar wood",
      "Ample storage space",
      "Durable construction"
    ],
    "image": "https://example.com/images/cedar_chest.jpg"
  },
  {
    "name": "Bamboo Shoe Rack",
    "subtitle": "Eco-friendly shoe rack",
    "description": "A sustainable and stylish shoe rack made from bamboo.",
    "rating": 4.3,
    "actualPrice": 100.0,
    "discountPrice": 90.0,
    "discountPercentage": 10,
    "paymentOptions": ["Credit Card", "PayPal", "Wallet"],
    "shopOwner": "EcoHome",
    "location": "Portland, USA",
    "highlights": ["Eco-friendly bamboo", "Compact design", "Easy to assemble"],
    "image": "https://example.com/images/bamboo_shoe_rack.jpg"
  }
];
