Class {
	#name : #ShouldBeImplementedInsteadOfTest,
	#superclass : #TestCase,
	#instVars : [
		'senderClass'
	],
	#category : #'ShouldBeImplementedInsteadOf-Tests'
}

{ #category : #tests }
ShouldBeImplementedInsteadOfTest >> isMethodCallRewrittenIn: aMethod [
	^ aMethod sourceCode lines third trimBoth = 'self newMethod'.
]

{ #category : #tests }
ShouldBeImplementedInsteadOfTest >> isMethodRenamedIn: aClass [
	^ (aClass includesLocalSelector: #newMethod) and: [ 
		(aClass includesLocalSelector: #oldMethod) not ].
]

{ #category : #initialization }
ShouldBeImplementedInsteadOfTest >> setUp [
	senderClass := ClientSubclass3.
	senderClass new newMethod.
	super setUp.
]

{ #category : #initialization }
ShouldBeImplementedInsteadOfTest >> tearDown [
	LibrarySuperclass revertRenamingInAllSubclasses.
	super tearDown.
]

{ #category : #tests }
ShouldBeImplementedInsteadOfTest >> testMethodCallsInHierarchyAreRewritten [
	{ ClientSubclass3 . ClientSubclass4 } do: [ :aClass |
		self assert: (self isMethodCallRewrittenIn: aClass >> #methodThatCallsOldMethod) ]
]

{ #category : #tests }
ShouldBeImplementedInsteadOfTest >> testMethodCallsOutsideHierarchyAreNotRewritten [
	self deny: (self isMethodCallRewrittenIn: ClientSubclass2 >> #methodThatCallsOldMethod)
]

{ #category : #tests }
ShouldBeImplementedInsteadOfTest >> testMethodIsNotRenamedInClassThatIsNeitherSubclassNorSuperclassOfSenderClass [
	self deny: (self isMethodRenamedIn: ClientSubclass2).
]

{ #category : #tests }
ShouldBeImplementedInsteadOfTest >> testMethodIsNotRenamedInLibrarySuperclass [
	self assert: (LibrarySuperclass includesLocalSelector: #oldMethod).
]

{ #category : #tests }
ShouldBeImplementedInsteadOfTest >> testMethodIsRenamedInAllSubclassesOfSenderClass [
	senderClass allSubclasses do: [ :aClass |
		self assert: (self isMethodRenamedIn: aClass) ].
]

{ #category : #tests }
ShouldBeImplementedInsteadOfTest >> testMethodIsRenamedInAllSuperclassesOfSenderClass [
	(senderClass allSuperclassesIncluding: LibrarySuperclass) allButLastDo: [ :aClass |
		self assert: (self isMethodRenamedIn: aClass) ].
]

{ #category : #tests }
ShouldBeImplementedInsteadOfTest >> testMethodIsRenamedInSenderClass [
	self assert: (self isMethodRenamedIn: senderClass)
]
