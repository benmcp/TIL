# Why code in ES2015 if the browser doesn't support it?

TLDR: Compilers.

## A bit of history

Lets start with a bit of history.

In the late 90's, with the fall of Netscape Navigator, Microsoft's Internet Explorer dominated the browser market with a ~95% market share.

At this point in time, Explorer could play by it's own rules. This being that it could create it's own standards which developers would have to adhere to due to their large market share.

However, with the release of FireFox in 2002, Mozilla followed the ECMAScript standards as a means to standardise the scripting language and remove much of the nuances that was presented by Internet Explorer at the time. With Safari's initial release in 2003 and later Google Chrome debuting in 2008, both of which additionally adhering to ECMAScript standards and the dropping market share by Internet Explorer, a crisis ensued.

The problem was that the standards that Internet Explorer had followed soon lost their market dominance. This resulted as nightmare for developers who had to build web applications to suit two collective bodies, one being Chrome, Safari and Firefox all honouring ECMAScript and the other being Internet Explorer following their own form of standards.

This began to change the game in how web applications were developed with focus turned to Firefox/Chrome/Safari first, and providing support/fallback/polyfills/graceful degradation/etc for Internet Explorer.

With the rise of Firefox/Chrome/Safari's combined market share came the dominance of ECMAScript standards. This was one of the contributing factors that resulted in Internet Explorer adopting ECMAScript standards.

The significance of this? For the foreseeable future, ECMAScript is here to stay across all major browsers.

## I get it, ECMAScript is important, but why newer versions if they aren't supported?

Ease of use and compilers!!! 

With the new features and standards that come out of ECMAScript, developers can write cleaner and more powerful code with fewer bugs.

Compilers such as [Babel](https://babeljs.io/) allow developers to build applications in the latest versions of ECMAScript and will output their code in a format that will adhere to a more legacy version of the ECMAScript standards which is read by the browser.

## But why bleeding edge?

Because it's fun and it will become essential in the future as support continues to improve.

Essentially JavaScript (and the web in general), exists in a constant state of change. At one end of the spectrum is new features and possibilities while the other slowly adheres to the changing times. It is in a developer's best interest to keep an eye on future standards as a means to both stay current, but more importantly, to build on the amazing skillset that they already have.