/* 
Copyright (c) 2021 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Rates : Codable {
	let cAD : Double?
	let hKD : Double?
	let iSK : Double?
	let pHP : Double?
	let dKK : Double?
	let hUF : Double?
	let cZK : Double?
	let aUD : Double?
	let rON : Double?
	let sEK : Double?
	let iDR : Double?
	let iNR : Double?
	let bRL : Double?
	let rUB : Double?
	let hRK : Double?
	let jPY : Double?
	let tHB : Double?
	let cHF : Double?
	let sGD : Double?
	let pLN : Double?
	let bGN : Double?
	let tRY : Double?
	let cNY : Double?
	let nOK : Double?
	let nZD : Double?
	let zAR : Double?
	let uSD : Double?
	let mXN : Double?
	let iLS : Double?
	let gBP : Double?
	let kRW : Double?
	let mYR : Double?

	enum CodingKeys: String, CodingKey {

		case cAD = "CAD"
		case hKD = "HKD"
		case iSK = "ISK"
		case pHP = "PHP"
		case dKK = "DKK"
		case hUF = "HUF"
		case cZK = "CZK"
		case aUD = "AUD"
		case rON = "RON"
		case sEK = "SEK"
		case iDR = "IDR"
		case iNR = "INR"
		case bRL = "BRL"
		case rUB = "RUB"
		case hRK = "HRK"
		case jPY = "JPY"
		case tHB = "THB"
		case cHF = "CHF"
		case sGD = "SGD"
		case pLN = "PLN"
		case bGN = "BGN"
		case tRY = "TRY"
		case cNY = "CNY"
		case nOK = "NOK"
		case nZD = "NZD"
		case zAR = "ZAR"
		case uSD = "USD"
		case mXN = "MXN"
		case iLS = "ILS"
		case gBP = "GBP"
		case kRW = "KRW"
		case mYR = "MYR"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		cAD = try values.decodeIfPresent(Double.self, forKey: .cAD)
		hKD = try values.decodeIfPresent(Double.self, forKey: .hKD)
		iSK = try values.decodeIfPresent(Double.self, forKey: .iSK)
		pHP = try values.decodeIfPresent(Double.self, forKey: .pHP)
		dKK = try values.decodeIfPresent(Double.self, forKey: .dKK)
		hUF = try values.decodeIfPresent(Double.self, forKey: .hUF)
		cZK = try values.decodeIfPresent(Double.self, forKey: .cZK)
		aUD = try values.decodeIfPresent(Double.self, forKey: .aUD)
		rON = try values.decodeIfPresent(Double.self, forKey: .rON)
		sEK = try values.decodeIfPresent(Double.self, forKey: .sEK)
		iDR = try values.decodeIfPresent(Double.self, forKey: .iDR)
		iNR = try values.decodeIfPresent(Double.self, forKey: .iNR)
		bRL = try values.decodeIfPresent(Double.self, forKey: .bRL)
		rUB = try values.decodeIfPresent(Double.self, forKey: .rUB)
		hRK = try values.decodeIfPresent(Double.self, forKey: .hRK)
		jPY = try values.decodeIfPresent(Double.self, forKey: .jPY)
		tHB = try values.decodeIfPresent(Double.self, forKey: .tHB)
		cHF = try values.decodeIfPresent(Double.self, forKey: .cHF)
		sGD = try values.decodeIfPresent(Double.self, forKey: .sGD)
		pLN = try values.decodeIfPresent(Double.self, forKey: .pLN)
		bGN = try values.decodeIfPresent(Double.self, forKey: .bGN)
		tRY = try values.decodeIfPresent(Double.self, forKey: .tRY)
		cNY = try values.decodeIfPresent(Double.self, forKey: .cNY)
		nOK = try values.decodeIfPresent(Double.self, forKey: .nOK)
		nZD = try values.decodeIfPresent(Double.self, forKey: .nZD)
		zAR = try values.decodeIfPresent(Double.self, forKey: .zAR)
		uSD = try values.decodeIfPresent(Double.self, forKey: .uSD)
		mXN = try values.decodeIfPresent(Double.self, forKey: .mXN)
		iLS = try values.decodeIfPresent(Double.self, forKey: .iLS)
		gBP = try values.decodeIfPresent(Double.self, forKey: .gBP)
		kRW = try values.decodeIfPresent(Double.self, forKey: .kRW)
		mYR = try values.decodeIfPresent(Double.self, forKey: .mYR)
	}

}