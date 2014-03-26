Here is a [CC0][] webapp built by using the cooper hewitts's [collections api][] and the [yahoo weather api][]

The idea is to show an icon, made up of a mosaic of objects from the collection

Please submit all questions, bugs and feature requests to [the issue page][]

#### Setup
  
  The application requires [node.js][], and supports [dtrace][].

  Node comes with npm, so `npm install` to grab all the dependencies, and `sudo npm start` to start the server. Make sure all the tests pass with `npm test`.

#### Usage

  Visit [localhost][] to see the application

#### Design Tradeoffs

** tradeoff 1: security < just start coding **

I wanted to see how much I could put in the browser. With the time constraint I decided it was more important to be able to easily run this with any server (not just node.js), but with the tradeoff that the auth-like-magic keys are easily viewable. With more time, would implement proper oauth, etc.

** tradeoff 2 - mobile friendliness < fun(ctionality?) **

I got pretty excited about the idea of drawing the icon made up of images, and using the color api. Kind of lost focus a bit on just showing a page with the weather an a possibly related object (either using keywords or color<->temperature mapping).

If I had to re-do, I would have just made a simple map of color to temperature and just shown one very blue or very red object, instead of biting off more than I could chew, like trying to learn canvas in half a day.

Given more time to optomize for mobile, I would

* cache and thumbnail all the images in my own db, which would help with loading times and reduce http requests to the api and cdn

* resize the icon resolution based on the mozile device screen size and orientation

Given a lot more time, i'd probably move it to a tile server (map style) or at least just pregenerate the icon images and serve them up locally...

#### Deployment

  I use [deliver][], which just requires editing `.deliver/config`, and running `deliver`. The application has been tested on OSX 10.9.

[CC0]: http://creativecommons.org/publicdomain/zero/1.0
[collections api]: https://collection.cooperhewitt.org/api
[yahoo weather api]: http://developer.yahoo.com/weather/
[the issue page]: https://github.com/jedahan/cooperweather/issues

[node.js]: http://nodejs.org
[DTrace]: http://mcavage.github.com/node-restify/#DTrace

[localhost]: http://localhost
[swagger]: http://swagger.wordnik.com
[restify]: http://mcavage.github.com/node-restify

[deliver]: https://github.com/gerhard/deliver