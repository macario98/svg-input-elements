svgNS = 'http://www.w3.org/2000/svg'
xlinkNS = 'http://www.w3.org/1999/xlink'

describe "The svgInputElements function", ->
	it "is a function called svgInputElements", ->
		expect(svgInputElements).toEqual jasmine.any Function 
	it "returns an object with the textareas g element in the property .gElement", ->
		g = svgInputElements().gElement
		expect(g.nodeName).toBe "g"
	it "takes an optional SVG element as a first parameter", ->
		svgElement = document.createElementNS svgNS, "svg"
		svgElement.setAttributeNS null, "version", "1.1"
		svgElement.setAttributeNS null, "width", "100px"
		svgElement.setAttributeNS null, "height", "100px"
		svgElement.setAttributeNS null, "id", "test"

		textarea = svgInputElements()
		textarea2 = svgInputElements(svgElement)

		expect(textarea.gElement).toBe textarea.gElement
		expect(textarea2.gElement).not.toBe textarea.gElement
	it "takes an optional options parameter after the optional SVG parameter", ->
		svgElement = document.createElementNS svgNS, "svg"
		options = 
			width: 100,
			height: 100
		expect(svgElement.nodeName).toBe "svg"
		expect(-> svgInputElements(options)).not.toThrow()
		expect(-> svgInputElements(svgElement, options)).not.toThrow()
		expect(-> svgInputElements(options, svgElement)).toThrow()
	it "requires that the options object has the properties width and height", ->
		options = 
			width: 100,
			height: 100
		expect(-> svgInputElements(options)).not.toThrow()
		expect(-> svgInputElements({})).toThrow()
	it "returns a g element within a new SVG element if no svg parameter was passed", ->
		expect(svgInputElements().gElement.parentNode.nodeName).toEqual "svg"
		expect(svgInputElements().gElement.parentNode.namespaceURI).toEqual svgNS

