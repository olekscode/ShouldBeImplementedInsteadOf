Extension { #name : #Object }

{ #category : #'*ShouldBeImplementedInsteadOf' }
Object >> shouldBeImplementedInsteadOf: anOldSelector [
	"Announce that this message should be implemented.
	If an oldSelector is implemented in the class hierarchy,
	rename it to the new selector and continue the execution"
	<debuggerCompleteToSender>
	
	ShouldBeImplementedInsteadOf
		signalFor: thisContext sender selector
		insteadOf: anOldSelector
		in: thisContext receiver class
		upUntil: thisContext sender contextClass.
]
