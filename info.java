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
(12) State
/*
	-> Remember the  stateful widget is actually a separate object from its state. but they are linked
    In other words, the state object knows which stateful widget it belongs to. The state object has a property
    called widget which will point to its parent stateful widget.
*/
(13) Show vs Hide 
	/*
		import '' show Platform
		-> show me the platform class
		import 'dart:io' hide Platform
		-> import everything that's inside dart:io, so everything inside here, all the classes I want to be able to 
			use it in this file but hide this thing called platform.
	*/
(14) consts
/*
	-> a const variable is a compile-time constant.
*/
(15) _.toStringAsFixed()
/*
	-> In order to convert our double into a single decimal place and also convert it into a string, there's a really
		convenient method. So we can write BMI.toStringAsFixed and this returns a decimal point string and we can 
		specify how many decimal places we want as the input.
*/
(16) const in class must be static
/*
	-> Why does it have to be static? Well the reason is because by having a const that already has a default value,
		that means that every object that gets created from this circle class will have the same value for this property
		called Pi and it will never be changed. So if you think about that, that sounds an awful lot like how static 
		variables work right? So it doesn't make sense to create a constant that is a property on a circle
		if it's not going to be static. So whenever you want a constant value to be associated with a class, you have 
		to make it into a static const
*/
(17) Hero Animation
/*
	-> it usually takes place on a screen transition. So when we go from page 1 of the screen to Page 2 of the screen
	 	if they have a shared element, then that element will transition between page 1 and page 2.
		So that element, being an image or an icon or whatever it may be, has to be present on both pages and it will 
		have a continuous transition as the user navigates from page  1 on to page 2 of the app. Now because they have
		that requirement of having a shared element, if you come from Android you might know this animation as a shared
		element transition.
*/
(18) Custom Animaation
/*
	-> animations that we're gonna be building with Flutter require just three things and it's three important concepts
		that you need to understand and to be able to really do what it is that you want it to do. And the three 
		components are a ticker, an animation controller and an animation value.
	-> Ticker: is exactly what it sounds like, it's a bit like the ticking of a clock. So we need something to be
	 	able to count and take our animation along so that at each tick of the clock, our animation changes in value and
		changes in shape or color whatever it may be. So for every time the ticker ticks, it triggers a new set state 
		so that we can render something different
	-> Animation Controller: and this is sort of the manager of the animation if you will. It's the animation 
		controller class which is going to tell the animation to start, to stop, to go forwards, to loop back, how long
		to animate for, all of these things are determined when we create an animation controller and set its properties.
	-> Animation Value: and this is the thing that actually does the animating. So usually the animation value will go
	 	from 0 to 1. And by using that value, we're able to change things such as the height or the size of a component
		or the color or the alpha or the opacity of a component.
*/
(19) vsync
/*
 -> the ticker provider is going to be our state object -> WelcomeScreen state. And to be able to turn this 
		WelcomeScreen state objects  into something that can act as a ticker, we have to use the keyword 'with' and 
		specify that this class WelcomeScreen state can act as a single ticker provider. So it's like we're upskilling 
		our WelcomeScreen state with a new ability. The ability to act as a ticker for a single animation. So if we had
		multiple animations then we would use the TickerProviderStateMixin.
*/
(20) Mixins
/*
	-> And mixins enable your class with different types of capability. And unlike inheriting from a class, you can 
		add multiple mixins to add many capabilities.
*/
(21) initState()
/*
	-> the init state it only gets called the first time that this state gets created. And that doesn't happen when
		we reload.
*/
(22) CurvedAnimation
/*
	-> animation with only animation controller happens linearly. So as it grows in size it grows linearly in size.And
		when we look at the value of the controller, you can see that the increments go from 0 through to 100 pretty 
		evenly right? And it's pretty much doing this about 60 times a second.
		
	-> if we wanted this to look a little bit different? Well then we could use a class called Curved Animation.
		And this way we can change the animation value along a curve. And the types of curves that we can use include
		things such as bouncing
	
	-> make sure that when you're applying a curved animation to your controller that we can't actually have an upper
		bound that's greater than 1. These curves have to draw from 0 to 1. So if we leave this upper bound in then 
		we'll actually get an exception thrown and our app or crash.	
*/
(23) Tween Animation.
/*
 -> tween animation. It's basically a set of predefined tween animations that essentially go in between values.
		So for example we have a starting color and we have an ending color, then our tween is going to go from
		the beginning to the end in a smooth transition.
	-> Now there's a whole bunch of other tween animations that you can use, such as the border radius tween
		or the alignment tween. But what they all do is take a beginning value and an end value and you can structure
		the code in the same way where we create the tween, we animated it and apply it to an animation controller.
		And then we use the value of that animation inside our build method.
*/
(24) Flexible Widget
/*
 -> this is the size that it should try to take up the given pixels. But if it can't, then it can be flexible
		about it and be smaller so that other parts of the screen is visible.'
*/