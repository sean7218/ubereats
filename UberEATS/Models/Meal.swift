//
//  Meal.swift
//  UberEATS
//
//  Created by Sean Zhang on 7/28/18.
//  Copyright © 2018 Sean Zhang. All rights reserved.
//

import Foundation

struct Meal {
    var name: String
    var description: String
    var price: Float
    var type: String
    
    init(name: String, description: String, type: String, price: Float) {
        self.name = name;
        self.description = description;
        self.price = price
        self.type = type
    }
    
    init(name: String) {
        self.name = name;
        self.description = "";
        self.price = 0.00
        self.type = ""
    }
    static func loadMealSections() -> [String] {
        let sections: [String] = ["Recommended", "Beef Tacos", "Seafood Tacos", "Chicken Tacos", "Pork Tacos",
                                  "Veggie Tacos", "Quesadillas", "Skillets", "Main", "Chips and Dips", "Sides",
                                  "Starters","Salads","Sweets", "Kids Menu"]
        
        return sections
    }
    static func loadMealsForSection(sectionName: String, meals: [Meal]) -> [Meal]{
        let filteredMeals = meals.filter { (m) -> Bool in
            return m.type == sectionName
        }
        return filteredMeals
    }
    static func loadDemoMeals() -> [Meal] {
        // Recommended
        let m1 = Meal(name: "Gus's Favorite Taco",
                      description: "Fired chicken, bacon, Cheddar cheese, pico de gallo, and chipotle ranch.",
                      type: "Recommended",
                      price: 4.80)
        let m2 = Meal(name: "Santa Fe Steak Quesadilla",
                      description: "Seared steak, jalapenos, onions, tomatoes, and cilantro drizzled with queso blanco. Served with a side of salsa",
                      type: "Recommended",
                      price: 12.5)
        let m3 = Meal(name: "Chicken, Bacon, and Ranch Quesadilla",
                      description: "Shredded chicken, bacon, grilled onions, red peppers, and pepper Jack cheese. Served with a side of ranch",
                      type: "Recommended",
                      price: 10.60)
        let m4 = Meal(name: "Burrito Del Rey Grande",
                      description: "Choice of Chicken, Pork or Beef with rice, beans, Cheddar cheese, guacamole, and pico de gallo",
                      type: "Recommended",
                      price: 16.00)
        let m5 = Meal(name: "Burrito Del Ray Regular",
                      description: "Choice of Chicken, Pork or Beef with rice, beans, Cheddar cheese, guacamole, and pico de gallo",
                      type: "Recommended",
                      price: 12.15)
        // Beef Tacos
        let m6 = Meal(name: "Old No 7 Taco",
                      description: "Seared steak, jalapenos, onions, tomatoes, cilantro, queso blanco, and chipotle ranch",
                      type: "Beef Tacos",
                      price: 5.45)
        let m7 = Meal(name: "Meat and Three Taco",
                      description: "Seared steak, grilled onions, sweet peppers, and queso blanco",
                      type: "Beef Tacos",
                      price: 5.45)
        let m8 = Meal(name: "Home of the Blues Cheese Taco",
                      description: "Seared steak, shredded lettuce, diced tomatoes, blue cheese crumbles, hot sauce, and fried jalapenos.",
                      type: "Beef Tacos",
                      price: 5.45)
        // Seafood Tacos
        let m9 = Meal(name: "Ring of Fire Taco",
                      description: "Chili rubbed shrimp, grilled onions, sweet peppers, lettuce, and salsa verde.",
                      type: "Seafood Tacos",
                      price: 6.05)
        let m10 = Meal(name: "It's Hard Out Here for a Shrimp Taco",
                      description: "Fried shrimp, TTC buffalo sauce, lettuce, shaved celery, and blue cheese crumbles",
                      type: "Seafood Tacos",
                      price: 6.05)
        let m11 = Meal(name: "Shrimp and Grind Taco",
                      description: "Seared shrimp, chorizo, onions, roasted corn, chipotle ranch, and topped with roasted sweet peppers",
                      type: "Seafood Tacos",
                      price: 6.40)
        let m12 = Meal(name: "Love Me Tuna Taco",
                      description: "Seared tuna, mango salsa, and chili sauce",
                      type: "Seafood Tacos",
                      price: 6.40)
        let m13 = Meal(name: "Catfish and Caviar Taco",
                      description: "Spanish spiced fried catfish, Mississippi caviar, and cilantro",
                      type: "Seafood Tacos",
                      price: 5.15)
        let m14 = Meal(name: "Bill is a Dancing",
                      description: "Blackened Tilapia, lettuce, pico de gallo, sriracha sour cream",
                      type: "Seafood Tacos",
                      price: 5.15)
        let m15 = Meal(name: "All Shuck up",
                      description: "Avocado, tomato, red onion, roasted corn, sauteed shrimp, cilantro lime vinaigrette, cilantro",
                      type: "Seafood Tacos",
                      price: 6.40)
        let m16 = Meal(name: "Rolling on the River",
                      description: "Catfish, purple cabbage slaw, guacamole, pica de galo",
                      type: "Seafood Tacos",
                      price: 6.05)
        // Chicken Tacos
        let m17 = Meal(name: "Remember the Alamo Taco",
                      description: "Shredded chicken, jalapenos, onions, tomatoes, and cilantro drizzled with queso blanco.",
                      type: "Chicken Tacos",
                      price: 4.80)
        let m18 = Meal(name: "Dixie Chicken Taco",
                       description: "Shredded chicken, TTC buffalo sauce, lettuce, shaved celery, and blue cheese crumbles.",
                       type: "Chicken Tacos",
                       price: 5.15)
        let m19 = Meal(name: "The Commodore Taco",
                       description: "Shredded chicken, luttuce, Cheddar cheese, and pico de gallo",
                       type: "Chicken Tacos",
                       price: 4.80)
        let m20 = Meal(name: "North Mississippi all Star Taco",
                       description: "Shredded chicken, grilled onions, fried jalapenos, and TTC BBQ Sauce",
                       type: "Chicken Tacos",
                       price: 4.80)
        let m21 = Meal(name: "Gues's Favorite Taco",
                       description: "Fried chicken, bacon, Cheddar cheese, pico de gallo, and chipotle ranch.",
                       type: "Chicken Tacos",
                       price: 4.80)
        let m22 = Meal(name: "Smashville Hot",
                       description: "Hot Sauce, Fried Chicken, Lettuce, Pica de Galo",
                       type: "Chicken Tacos",
                       price: 5.15)
        let m23 = Meal(name: "Redbird",
                       description: "Buffalo Fried Chicken, Chorizo, Pepper Jack Cheese",
                       type: "Chicken Tacos",
                       price: 5.15)
        let m24 = Meal(name: "yardbird Strut",
                       description: "Shredded Chicken, Purple Cabbage Slaw",
                       type: "",
                       price: 4.80)
        let m25 = Meal(name: "Bur-Co",
                       description: "Shredded Chicken, Black Beans, Chorizo, Pico de gtalo, Chipotle ranch.",
                       type: "Chicken Tacos",
                       price: 5.15)
        // Pork Tacos
        let m26 = Meal(name: "Don't Go Bacon My Heart Taco",
                       description: "Pork belly, Asian coleslaw, and chili sauce.",
                       type: "Pork Tacos",
                       price: 4.80)
        let m27 = Meal(name: "Tom Lee Pork Taco",
                       description: "Pulled pork, pickled onions, and avocado cream.",
                       type: "Pork Tacos",
                       price: 4.50)
        let m28 = Meal(name: "Memphis in May-ICO Taco",
                       description: "Pibil, pineapple, and jalapeno chutney.",
                       type: "Pork Tacos",
                       price: 4.50)
        // Veggie Tacos
        let m29 = Meal(name: "Natchez Trace Taco",
                       description: "Rice, Cotija cheese, street corn, and cilantro",
                       type: "Veggie Tacos",
                       price: 4.80)
        let m30 = Meal(name: "Bonnaroo Breakfast Taco",
                       description: "Tater tots, melted Cheddar cheese, avocado salsa.",
                       type: "Veggie Tacos",
                       price: 4.80)
        let m31 = Meal(name: "Caulilujah Taco",
                       description: "Crispy cauliflower, roasted corn, red onions, and avocado cream",
                       type: "Veggie Tacos",
                       price: 4.50)
        // Quesadillas
        let m32 = Meal(name: "Chicken, Bacon, and Ranch Quesadilla",
                       description: "Shredded chicken, bacon, grilled onions, red peppers, and pepper jack cheese. Served with size of ranch",
                       type: "Quesadillas",
                       price: 10.60)
        let m33 = Meal(name: "BBQ Chicken Quesadilla",
                       description: "BBQ Chicken, grilled sweet peppers, onions, and pepper Jack cheese, Served with side of queso.",
                       type: "Quesadillas",
                       price: 10.60)
        let m34 = Meal(name: "Santa Fe Steak Quesadilla",
                       description: "Seared steak, jalapenos, onions, tomatoes, and cilantro drizzled with queso blanco. Served with a side of salsa",
                       type: "Quesadillas",
                       price: 12.50)
        let m35 = Meal(name: "Queso Quesadilla",
                       description: "Pepper Jack cheese, Cheddar cheese, and Cotija cheese. Served with a side of queso blanco",
                       type: "Quesadillas",
                       price: 9.95)
        let m36 = Meal(name: "Breakfast Quesadilla",
                       description: "Scrambled eggs, bacon, cheddar & pepper jack (served with a side a salsa)",
                       type: "Quesadillas",
                       price: 10.60)
        // Skillets
        let m37 = Meal(name: "Chicken Skillet",
                       description: "Marinated chicken breast with grilled sweet peppers and queso. Served over rice, corn, and black beans.",
                       type: "Skillets",
                       price: 12.50)
        let m38 = Meal(name: "Beef Skillet",
                       description: "Marinated beef, caramelized onions, grilled sweet peppers, and pepper jack cheese. Served over rice, corn and black beans.",
                       type: "Skillets",
                       price: 13.45)
        let m39 = Meal(name: "Shrimp Skillet",
                       description: "Chili rubbed shrimp, caramelized onins, and jalapenos. Served over rice, corn, and black beans",
                       type: "Skillets",
                       price: 14.40)
        let m40 = Meal(name: "Veggie Skillet",
                       description: "Roasted cauliflower, caramelized onions, grilled sweet peppers, and pepper jack cheese. Served over rice, corn, and black beans.",
                       type: "Skillets",
                       price: 11.55)
        let m41 = Meal(name: "Blackened Tilapia",
                       description: "Rice, fried cauliflower, street corn, beans, grilled onions, grilled peppers, jalapenos & source cream",
                       type: "Skillets",
                       price: 14.10)
        // Main
        let m4x = Meal(name: "Main Street Grizzly Taco ",
                       description: "",
                       type: "Main",
                       price: 12.80)
        // Chips and Dips
        let m42 = Meal(name: "Guacing in Memphis",
                       description: "",
                       type: "Chips and Dips",
                       price: 12.80)
        let m43 = Meal(name: "House Salsa",
                       description: "",
                       type: "Chips and Dips",
                       price: 5.15)
        let m44 = Meal(name: "Warm Street Corn",
                       description: "",
                       type: "Chips and Dips",
                       price: 9.60)
        let m45 = Meal(name: "Queso",
                       description: "",
                       type: "Chips and Dips",
                       price: 8.35)
        let m46 = Meal(name: "Queso Con Carne",
                       description: "",
                       type: "Chips and Dips",
                       price: 9.60)
        // Sides
        let m47 = Meal(name: "Seasoned Rice",
                       description: "",
                       type: "Sides",
                       price: 2.60)
        let m48 = Meal(name: "Black Beans",
                       description: "",
                       type: "Sides",
                       price: 2.60)
        let m49 = Meal(name: "Tarter Tots",
                       description: "",
                       type: "Sides",
                       price: 3.20)
        let m50 = Meal(name: "Elote",
                       description: "",
                       type: "Sides",
                       price: 5.80)
        // Starters
        let m51 = Meal(name: "Buffalo Shrimp",
                       description: "Fried shrimp tossed in TTC buffalo sauce and shaved celery",
                       type: "Starters",
                       price: 12.80)
        let m52 = Meal(name: "Pot O' Tots",
                       description: "Fried tater tots, queso, Cheddar cheese, cripy pork belly, bacon, chorizo, and sausage drizzled with TTC BBQ sauce.",
                       type: "Starters",
                       price: 15.40)
        let m53 = Meal(name: "Sweet Fries",
                       description: "Sweet potato fries with Chinese five spice and drizzled with honey",
                       type: "Starters",
                       price: 10.25)
        let m54 = Meal(name: "Buffalo Chicken Nachos",
                       description: "Tortilla chips covered with queso blanco, shaved celery, blue cheese crumbles, and shredded Buffalo chicken drizzled with ranch and buffalo sauce",
                       type: "Starters",
                       price: 11.55)
        let m55 = Meal(name: "Veggie Wings",
                       description: "Fried cauliflower tossed in TTC buffalo sauce",
                       type: "Starters",
                       price: 10.25)
        let m56 = Meal(name: "BBQ Nachos",
                       description: "Tortilla Chips, Queso, Cheddar Cheese, Pulled Pork, BBQ Sauce and Jalapenos",
                       type: "Starters",
                       price: 11.55)
        let m57 = Meal(name: "Crawfish and Chorizo Mac n Cheese",
                       description: "spicy Crawfish, Chorizo, Pasta Sheels and Cheddar Cheese Sauce",
                       type: "Starters",
                       price: 11.55)
        let m58 = Meal(name: "Pot O Tots Half Order",
                       description: "Cast iron pot full of fried tater tots, quest, cheddar cheese, pulled pork, chorizo drizzled BBQ sauce",
                       type: "Starters",
                       price: 10.25)
        // Salads
        let m59 = Meal(name: "Southwest Chicken Salad",
                       description: "Grilled chicken over mixed greens with avacado, roasted corn, tomatoes, bacon, black beans, blue cheese crumbles, and choice of dressing",
                       type: "Salads",
                       price: 15.40)
        let m60 = Meal(name: "Pescado Salad",
                       description: "Seared Tilapia over mixed greens tossed in sweet red pepper vinaigrette with roasted corn, redonions & donita cheese, topped with avocado",
                       type: "Salads",
                       price: 15.40)
        // Sweets
        let m61 = Meal(name: "Tres Leches",
                       description: "Served with Strawberries",
                       type: "Sweets",
                       price: 8.35)
        let m62 = Meal(name: "Donuts",
                       description: "Served with choice of strawberry, mango, or chocolate sauce",
                       type: "Sweets",
                       price: 7.70)
        // Kids Menu
        let m63 = Meal(name: "Cheese Quesadilla",
                       description: "Served with tater tots.",
                       type: "Kids Menu",
                       price: 7.05)
        let m64 = Meal(name: "Fried Chicken Nuggets",
                       description: "Served with tater tots.",
                       type: "Kids Menu",
                       price: 7.05)
        let m65 = Meal(name: "Mac and Cheese",
                       description: "Served with tater tots.",
                       type: "Kids Menu",
                       price: 7.05)

        return [m1, m2, m3, m4, m5, m6, m7, m8, m9, m10, m11, m12, m13, m14, m15, m16, m17, m18, m19, m20, m21, m22, m23, m24, m25, m26, m27, m28, m29, m30, m31, m32, m33, m34, m35, m36, m37, m38, m39, m40, m41, m42, m43, m44, m45, m46, m47, m48, m49, m50, m51, m52, m53, m54, m55, m56, m57, m58, m59, m60, m61, m62, m63, m64, m65, m4x]
        
    }
}
