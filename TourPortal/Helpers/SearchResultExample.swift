//
//  SearchResultExample.swift
//  TourPortal
//
//  Created by Max Shashkov on 20.04.2022.
//

import Foundation
import CoreLocation

var searchResultExample =
[
  Hotel(id: "0",
        name: "ALEAN FAMILY RESORT & RIVIERA 4*",
        shortName: "ALEAN RIVIERA 4*",
        cost: 98000.00,
        rating: 4,
        address: "Краснодарский край, г. Анапа, Пионерский пр., 28",
        imagesURL: [
          "https://uploads2.stells.info/storage/png/1/1b/11b7daf78e457e25a28c1b91acf957d6.png", "https://uploads2.stells.info/storage/jpg/f/e2/fe2b4c4fea5f6bd34d72b64c1892281f.jpg", "https://uploads2.stells.info/storage/jpg/d/58/d58d65f3e94348f6713795445ab0f47a.jpg", "https://uploads2.stells.info/storage/jpg/a/17/a17406ee5b6df9f1d8552c9ed058dda2.jpg", "https://uploads2.stells.info/storage/jpg/7/fe/7feec5931d852a041fedaa6d9d03e107.jpg", "https://uploads2.stells.info/storage/jpg/3/28/3288658053c0613d4d30800ae66666aa.jpg", "https://uploads2.stells.info/storage/jpg/f/43/f43347055604e4364abf99947f92e085.jpg"], coordinates: nil),
  Hotel(id: "1",
        name: "Grand Hotel Anapa",
        shortName: "Grand Hotel Anapa",
        cost: 112000.00,
        rating: 5,
        address: "г. Анапа, проезд Голубые дали, 1А",
        imagesURL: [
          "https://uploads2.stells.info/storage/jpg/7/85/785e7e3a874077276111903f78ddb219.jpg", "https://uploads2.stells.info/storage/jpg/9/dc/9dc2296c79f5956094a43a20d239e22b.jpg", "https://uploads2.stells.info/storage/jpg/2/1b/21be696e251bb5d2869a4350ee856fe9.jpg", "https://uploads2.stells.info/storage/jpg/8/ee/8eebbbf7ed776b0f00e1400408f4822b.jpg", "https://uploads2.stells.info/storage/jpg/b/40/b40c91eb37d9a1651089d640ec6c603c.jpg", "https://uploads2.stells.info/storage/jpg/1/78/178b606c7bd8ff98ff9ba38b2a48312c.jpg", "https://uploads2.stells.info/storage/jpg/4/f2/4f2f90d7f09c4233e5ee16e447c1eae7.jpg"], coordinates: nil),
  Hotel(id: "2",
        name: "Старый город",
        shortName: "Старый город",
        cost: 86000.00,
        rating: 3,
        address: "Краснодарский край, г-к Анапа, ул. Кирова, 3",
        imagesURL: [
          "https://uploads2.stells.info/storage/jpg/7/5f/75f4522953157fd576a5efb6f8aa7d5d.jpg", "https://uploads2.stells.info/storage/jpg/0/05/0055e3437a386153603f823974bcdad1.jpg", "https://uploads2.stells.info/storage/jpg/3/6d/36d7114ff5ab6454e7848152cd2e33d6.jpg", "https://uploads2.stells.info/storage/jpg/4/5f/45fbb1767b503bfa78f650c8cbc074df.jpg", "https://uploads2.stells.info/storage/jpg/1/a5/1a54a3be32ff916be9e22de6676a711a.jpg", "https://uploads2.stells.info/storage/jpg/6/73/6736a3855394115005872efaaaf348b1.jpg",
          "https://uploads2.stells.info/storage/jpg/b/29/b2940d611d78c2a9a3c0e187b5b956a5.jpg",
          "https://uploads2.stells.info/storage/jpg/7/94/7943656f6b51fb4a09da789f5668641d.jpg",
          "https://uploads2.stells.info/storage/jpg/d/d2/dd26191c19bac026e30ce47fc2037ae4.jpg",
          "https://uploads2.stells.info/storage/jpg/3/da/3da5359acaf87cc2a7b005bbb86dc911.jpg",
          "https://uploads2.stells.info/storage/jpg/9/f5/9f5988df1f8732a484426860111d5801.jpg"],
        coordinates: CLLocationCoordinate2D(latitude: 44.8906, longitude: 37.3010)),
  Hotel(id: "3",
        name: "Kormal Анапа",
        shortName: "Kormal Анапа",
        cost: 54200.00,
        rating: 1,
        address: "Краснодарский край, г-к. Анапа, пос. Витязево, пер.Морской, д. 8",
        imagesURL: [
          "https://uploads2.stells.info/storage/jpg/e/12/e12863b01280778de03b126686d0a265.jpg",
          "https://uploads2.stells.info/storage/jpg/0/1c/01c68f98c1a6d3c5ea3b93c5142f6465.jpg",
          "https://uploads2.stells.info/storage/jpg/8/b8/8b88efc52f5960a2aabcc976810a543d.jpg",
          "https://uploads2.stells.info/storage/jpg/e/92/e926be693e989b7415abf72f51902fcd.jpg",
          "https://uploads2.stells.info/storage/jpg/3/1d/31d3f5adf22f78271f7c2cd0d04d867c.jpg", "https://uploads2.stells.info/storage/jpg/8/7e/87eff180ee91183ea3bde9d59bac361b.jpg", "https://uploads2.stells.info/storage/jpg/9/9f/99fdde6560229d0de6b84a740259d767.jpg",
          "https://uploads2.stells.info/storage/jpg/9/6a/96a474eed3d5a2aab12bc775945386c9.jpg"], coordinates: CLLocationCoordinate2D(latitude: 44.9807, longitude: 37.2697))
]
