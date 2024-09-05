//
//  Database.swift
//  SipLog
//
//  Created by Kris Sawyerr on 9/5/24.
//

import Foundation
import SQLite

class Database {
    var db: Connection?

    init() {
        connect()
    }

    func connect() {
        do {
            let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("db.sqlite3").path
            print(path)
            db = try Connection(path)
            print("Database connected")

            let tableExists = try db!.scalar("SELECT name FROM sqlite_master WHERE type='table' AND name='MyDrinks';") != nil
            if !tableExists {
                createTable()
            } else {
                print("Table 'MyDrinks' exists.")
            }
            
        } catch {
            print("Unable to connect to database: \(error)")
        }
    }

    
    func createTable() {
        do {
            let table = Table("MyDrinks")
            let id = Expression<Int64>("id")
            let idDrink = Expression<String>("idDrink")
            let strDrink = Expression<String>("strDrink")
            let strCategory = Expression<String>("strCategory")
            let strAlcoholic = Expression<String>("strAlcoholic")
            let strDrinkThumb = Expression<String>("strDrinkThumb")
            let strIngredient1 = Expression<String>("strIngredient1")
            let strIngredient2 = Expression<String>("strIngredient2")
            let strIngredient3 = Expression<String>("strIngredient3")
            let strIngredient4 = Expression<String>("strIngredient4")
            let strIngredient5 = Expression<String>("strIngredient5")
            let strIngredient6 = Expression<String>("strIngredient6")
            let strIngredient7 = Expression<String>("strIngredient7")
            let strIngredient8 = Expression<String>("strIngredient8")
            let strIngredient9 = Expression<String>("strIngredient9")
            let strIngredient10 = Expression<String>("strIngredient10")
            let strIngredient11 = Expression<String>("strIngredient11")
            let strImageSource = Expression<String>("strImageSource")
            let strImageAttribution = Expression<String>("strImageAttribution")
            
            try db?.run(table.create { t in
                t.column(id, primaryKey: true)
                t.column(idDrink)
                t.column(strDrink)
                t.column(strCategory)
                t.column(strAlcoholic)
                t.column(strDrinkThumb)
                t.column(strIngredient1)
                t.column(strIngredient2)
                t.column(strIngredient3)
                t.column(strIngredient4)
                t.column(strIngredient5)
                t.column(strIngredient6)
                t.column(strIngredient7)
                t.column(strIngredient8)
                t.column(strIngredient9)
                t.column(strIngredient10)
                t.column(strIngredient11)
                t.column(strImageSource)
                t.column(strImageAttribution)
            })
            print("Table created")
        } catch {
            print("Create table failed: \(error)")
        }
    }

    func insertDrink(drink: DrinksModel) {
        do {
            let table = Table("MyDrinks")
            let idDrink = Expression<String>("idDrink")
            let strDrink = Expression<String>("strDrink")
            let strCategory = Expression<String>("strCategory")
            let strAlcoholic = Expression<String>("strAlcoholic")
            let strDrinkThumb = Expression<String>("strDrinkThumb")
            let strIngredient1 = Expression<String>("strIngredient1")
            let strIngredient2 = Expression<String>("strIngredient2")
            let strIngredient3 = Expression<String>("strIngredient3")
            let strIngredient4 = Expression<String>("strIngredient4")
            let strIngredient5 = Expression<String>("strIngredient5")
            let strIngredient6 = Expression<String>("strIngredient6")
            let strIngredient7 = Expression<String>("strIngredient7")
            let strIngredient8 = Expression<String>("strIngredient8")
            let strIngredient9 = Expression<String>("strIngredient9")
            let strIngredient10 = Expression<String>("strIngredient10")
            let strIngredient11 = Expression<String>("strIngredient11")
            let strImageSource = Expression<String>("strImageSource")
            let strImageAttribution = Expression<String>("strImageAttribution")

            let insert = table.insert(
                idDrink <- drink.idDrink!,
                strDrink <- drink.strDrink!,
                strCategory <- drink.strCategory!,
                strAlcoholic <- drink.strAlcoholic!,
                strDrinkThumb <- drink.strDrinkThumb!,
                strIngredient1 <- drink.strIngredient1!,
                strIngredient2 <- drink.strIngredient2!,
                strIngredient3 <- drink.strIngredient3!,
                strIngredient4 <- drink.strIngredient4!,
                strIngredient5 <- drink.strIngredient5!,
                strIngredient6 <- drink.strIngredient6!,
                strIngredient7 <- drink.strIngredient7!,
                strIngredient8 <- drink.strIngredient8!,
                strIngredient9 <- drink.strIngredient9!,
                strIngredient10 <- drink.strIngredient10!,
                strIngredient11 <- drink.strIngredient11!,
                strImageSource <- drink.strImageSource!,
                strImageAttribution <- drink.strImageAttribution!
            )
            
            try db?.run(insert)
            print("Insert succeeded")
        } catch {
            print("Insert failed: \(error)")
        }
    }


    func query() -> [MyDrinksModel] {
        var results: [MyDrinksModel] = []
        do {
            let table = Table("MyDrinks")
            let id = Expression<Int64>("id")
            let idDrink = Expression<String>("idDrink")
            let strDrink = Expression<String>("strDrink")
            let strCategory = Expression<String>("strCategory")
            let strAlcoholic = Expression<String>("strAlcoholic")
            let strDrinkThumb = Expression<String>("strDrinkThumb")
            let strIngredient1 = Expression<String>("strIngredient1")
            let strIngredient2 = Expression<String>("strIngredient2")
            let strIngredient3 = Expression<String>("strIngredient3")
            let strIngredient4 = Expression<String>("strIngredient4")
            let strIngredient5 = Expression<String>("strIngredient5")
            let strIngredient6 = Expression<String>("strIngredient6")
            let strIngredient7 = Expression<String>("strIngredient7")
            let strIngredient8 = Expression<String>("strIngredient8")
            let strIngredient9 = Expression<String>("strIngredient9")
            let strIngredient10 = Expression<String>("strIngredient10")
            let strIngredient11 = Expression<String>("strIngredient11")
            let strImageSource = Expression<String>("strImageSource")
            let strImageAttribution = Expression<String>("strImageAttribution")

            for row in try db!.prepare(table) {
                let drink = MyDrinksModel(
                    id: row[id],
                    idDrink: row[idDrink],
                    strDrink: row[strDrink],
                    strCategory: row[strCategory],
                    strAlcoholic: row[strAlcoholic],
                    strDrinkThumb: row[strDrinkThumb],
                    strIngredient1: row[strIngredient1],
                    strIngredient2: row[strIngredient2],
                    strIngredient3: row[strIngredient3],
                    strIngredient4: row[strIngredient4],
                    strIngredient5: row[strIngredient5],
                    strIngredient6: row[strIngredient6],
                    strIngredient7: row[strIngredient7],
                    strIngredient8: row[strIngredient8],
                    strIngredient9: row[strIngredient9],
                    strIngredient10: row[strIngredient10],
                    strIngredient11: row[strIngredient11],
                    strImageSource: row[strImageSource],
                    strImageAttribution: row[strImageAttribution]
                )
                results.append(drink)
            }
        } catch {
            print("Query failed: \(error)")
        }
        return results
    }

    func delete(drink: MyDrinksModel) {
        do {
            let table = Table("MyDrinks")
            let id = Expression<Int64>("id")
            let deletedDrink = table.filter(id == drink.id)
            try db?.run(deletedDrink.delete())
            print("Deleted drink")
        } catch {
            print("Delete failed: \(error)")
        }
    }
}
