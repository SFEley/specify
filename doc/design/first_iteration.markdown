The First Iteration
===================
Getting started is often the hardest part of good behavior-driven development. Typing `rails myappname` is easy; but once you've got that, then what? Make a scaffold? Install every plugin you think you'll ever need? Do you do models first, or views first? How much should you know before you code?

I thought about this before I started, and jotted down a sequence of steps on note cards. It's not the _only_ good way to get started, but I'm pretty sure it doesn't suck. At least by having a template to follow, I won't flail later on.

The Short List
--------------
In summary, it comes down to:

* Vision and user stories
* Pick one user story and call it a feature
* Mock up the feature on paper and in HTML
* Write scenarios for the feature
* Write steps for one scenario
* Spec and create the model
* Spec and create the controller
* Spec and create the view

The Long List
-------------
In detail, the steps:

1. Write down your vision. "What _is_ the app?" in one sentence.
2. Write some user stories. More than you need is okay; but make sure you have the core ones.
3. Pick _one_ story to implement first. Do not pick two. Three is shooting yourself in the head.
4. Set up your environment. Install gems if needed, create your Rails app, and check it into version control.
5. Paper prototype the screen(s) for that story, then mock it up in HTML in /public.
6. Write scenarios for your story as a feature in Cucumber.
7. Write steps for _one_ of those scenarios, using what you learned from the HTML mockup. Use Webrat for HTML elements.
8. Identify the model(s) you need. Hopefully just one, if you picked the right starting point.
9. Determine what fields you need in that model to implement your scenario. _Do not_ define any fields you don't need yet.
10. Write a fixture or factory method for it. Put plausible values in for the fields you've defined.
11. Create a model spec file. For now, just include one example: `it "should be valid"`.
12. Fire up `script/autospec`. Watch it fail. Yay.
13. Now (finally!) create the model. It's okay to use `script/generate model` to shortcut the migration definition.
14. Make an example for another model behavior (e.g. `it "should require a title"`), then implement it in the model. Repeat until the model is implemented for this scenario. Let autospec give you constant psychological reinforcement.
15. Create a controller spec file. Use your factory to populate data to save mocking time. Describe one action for the scenario (probably 'show' or 'index' or 'new'). Just write a spec that it renders the right template.
16. Add the resource to **routes.rb** and make the empty controller file.
17. Implement your controller action.
18. Rinse, lather, repeat for the controller spec and controller actions. Spec your data loads and saves, then write them until the scenario feels done.
19. Create a view spec for one of the needed views. Don't try to mock the whole model, as that's a pain; instead build a new instance with your factory (don't save it unless you have to). In the example, only create expectations for elements that are really important. If it's a form, spec the form behavior as a shared behavior to save time between 'new' and 'edit'.
20. Create the view. With the HTML already written, it should be really easy. For maximum readability, use `html2haml` to convert it to HAML. Once again, anything that isn't part of your scenario, leave it mocked.
21. Repeat specing and view creation for any other significant views or view cases. (I.e., reloading the existing data for a 'new' form that didn't validate correctly and showing errors.)
22. Run the feature scenario again. Does it pass?  Whoo!  If it doesn't, figure out whether it's the test or the implementation that's broken, and fix whatever until it looks right.
23. Run the actual app, too, and eyeball it. This step isn't just important, it _feels_ good.
24. Next scenario. Do it until the feature's done. Then do something to be nice to yourself.
