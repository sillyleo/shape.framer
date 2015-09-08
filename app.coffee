retina = 1

bg = new Layer width: 320*retina, height: 568*retina, x: 0, y: 0, backgroundColor: "rgba(241,241,241,1.00)"
shape = new Layer width: 115*retina, height: 115*retina, x: 103*retina, y: 113*retina, backgroundColor: "rgba(255,193,7,1.00)"
text = new Layer width: 176*retina, height: 27*retina, x: 71*retina, y: 454*retina, image: "images/text.png"

bg.states.add {
	1: width: 320*retina, height: 568*retina, x: 0, y: 0, backgroundColor: "rgba(241,241,241,1.00)", cornerRadius: 0*retina, rotation: 0, opacity: 1
	2: width: 320*retina, height: 568*retina, x: 0, y: 0, backgroundColor: "rgba(241,241,241,1.00)", cornerRadius: 0*retina, rotation: 0, opacity: 1
	3: width: 320*retina, height: 568*retina, x: 0, y: 0, backgroundColor: "rgba(241,241,241,1.00)", cornerRadius: 0*retina, rotation: 0, opacity: 1
}
bg.states.switchInstant '1'

shape.states.add {
	1: width: 115*retina, height: 115*retina, x: 103*retina, y: 113*retina, backgroundColor: "rgba(255,193,7,1.00)", cornerRadius: 0*retina, rotation: 0, opacity: 1
	2: width: 115*retina, height: 115*retina, x: 103*retina, y: 308*retina, backgroundColor: "rgba(255,193,7,1.00)", cornerRadius: 0*retina, rotation: 0, opacity: 1
	3: width: 115*retina, height: 115*retina, x: 103*retina, y: 397*retina, backgroundColor: "rgba(255,193,7,1.00)", cornerRadius: 0*retina, rotation: 0, opacity: 1
}
shape.states.switchInstant '1'

text.states.add {
	1: width: 176*retina, height: 27*retina, x: 71*retina, y: 454*retina, rotation: 0, opacity: 0
	2: width: 176*retina, height: 27*retina, x: 71*retina, y: 454*retina, rotation: 0, opacity: 1
	3: width: 176*retina, height: 27*retina, x: 71*retina, y: 278*retina, rotation: 0, opacity: 1
}
text.states.switchInstant '1'


generatedState1 = "1"
generatedState2 = "2"
generatedState3 = "3"


layers = [bg, shape, text]
generatedStates = [generatedState1, generatedState2, generatedState3]

cycler = Utils.cycle(generatedStates)
justdoit = () ->
	Utils.delay 1, ->
		nextState = cycler()
		for item in layers
			item.states.switch nextState
		justdoit()

justdoit()
