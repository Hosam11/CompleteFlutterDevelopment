(1) Scaffold
/*
	-> Scaffold just a blank screen for our app. And inside the scaffold, we're going to add an app bar at the top.

	-> scaffold in this Material app, so that we can have an app bar, we can have a body where most of our app is 
		going to go, or we can have a floating button if we wanted to.
*/	
(2) AppBar
/*
	-> this is a pre-built widget that simply looks like an app bar and acts like an app bar. 
*/
(3) Container
/*
	-> And this container is just a box and it's going to contain the content of my app.
*/
(4) MaterialApp
/*
	-> MaterialApp, and this app will be something that conforms to the material design pattern. And material design 
	is simply just a design style or a concept that was created by Google and a lot of startups and a lot of 
	companies have adopted it for their websites and mobile apps. And by using Flutter, we get to tap into a lot of
	these material components, through the use of Flutter widgets.

	-> inside the Material App, the most important thing you get to set is the {HOME}, And this is 
	where everything starts. 

	-> Material App, which is going to be the basis for all the other widgets that we're going to construct on-screen.
	And by including the Material App, we also get to tap into all of the components or widgets that the Material apps
	come with, such as a text or an image widget.
*/
(5) Key Class 
/*
	-> key class is something that you use when you need to keep track of the state of widgets. And this is 
		especially useful when your widgets are moving around in the widget tree, when they're changing their position
		in the widget tree. This usually happens when your widgets are physically moving on the screen such as in an 
		animation or when you see things scrolling on screen. But in most other cases, we don't actually need it.
*/
(6) Enum
/*
	->enums are really useful when you have more than one option for a property. So things such as car types or 
		high-low medium settings or in our case genders male female etc
*/
(7) Functions
/*
 -> functions are first class citizens. This means that they have a type and they can be passed around just like any
  other type for example a string or an int. And they can also be set as the value of a variable or a constant.
*/
(8) SliderTheme.of(context).copyWith()
/*
 -> .of  we know that we already have a default SliderTheme. And we can tap into it and use a method called
	.of which will return the data, so that data property, from the closest SliderTheme in the given context.
	So we can write SliderTheme .of And then we could provide a build context which comes from params in build function.
	And this context is basically the current state of our app. It's how our app appears as it is. And that will 
	include the current SliderTheme. So then if we say .of, we get a copy of what it looks like by default as it is. 
	And then we can write again using that .copyWith which we saw previously where we copied over our dark theme 
	and simply added a couple of changes.
*/
(9) build custom widgets
/*
	-> Flutter, the way that it's built favors composition over inheritance. So what does that mean?
		It means that we want to try and build things from scratch from the simplest widgets possible and that
		way Flutter can keep our component's performance and keep our apps fast. So how do we actually go about
		composing widgets? Well even if we think about a basic widget such as a container, it's actually composed of 
		smaller widgets such as a LimitedBox with a ConstrainedBox with some Align with some Padding with a DecoratedBox. So
		a whole bunch of widgets that are very basic and do very simple things came together to build a container.
		And this goes back to that idea of having very simple immutable building blocks that are like small pieces of 
		Lego. And by combining these simple widgets together, we can build a more complex and more interesting widget.

	-> So rather than taking a pre-built large widget such as a FloatingActionButton and trying to somehow
		inherit it and then override certain things about it, it's actually much easier in Flutter to just break
		it into smaller pieces to see how it's created by looking at the open source code and then just building
		it together yourself using the simplest, the most basic building blocks that Flutter gives you access to
*/
(10) Synchronous and Asynchronous
/*
	-> synchronous. Everything happens in synchrony.Step 1 happens, then step 2 happens and only when step 2 has 
		concluded or has finished and we've gotten the image back does step 3 actually execute.

	-> asynchronous. step 1 would execute as usual no changes there. But step 2, let's say that we're now loading
		our image from NASA asynchronously. Well in this case while the image is loading and we're trying to wait on 
		that data to come back, we can already execute step 3. And we don't have to wait for this to finish before we 
		continue in our code.
*/
(11) State
/*
	-> stateful widgets and we know that these stateful widgets can be combined and we can track the state using a 
		state object. Now that state object is there keep track of variables such as what is the configuration of my 
		widgets, what are the properties of my widgets. And I can change all of those variables by using a set state and
		it will update my app. Now in this case, the state object actually lives a lot longer and so it's got more 
		lifecycle methods.
*/
(12)
/*
	-> Remember the  stateful widget is actually a separate object from its state. but they are linked
    In other words, the state object knows which stateful widget it belongs to. The state object has a property
    called widget which will point to its parent stateful widget.
*/

