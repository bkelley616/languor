# languor

**About**

languor is a side project I started with the goal of creating an Elixir umbrella application for multiple web games similar to Slither.io or Agar.io

This repository currently only contains the set up for the umbrella application and the core website that will be connected to the multiple game sites for live player counts and other information.

The hope is to learn more about fun

## [languor.co](https://www.languor.co/) Tech Stack

[languor.co](https://www.languor.co/)  is built using elixir on both the front end and backend with minimal JavaScript needed. It uses the PETAL Stack:

- [Phoenix](https://www.phoenixframework.org/)
- [Elixir](https://elixir-lang.org/)
- [Tailwind](https://tailwindcss.com/)
- [AlpineJs](https://alpinejs.dev/)
- [LiveView](https://hexdocs.pm/phoenix_live_view/Phoenix.LiveView.html)

Phoenix, Elixir, and LiveView provide the core functionality of the MVC web framework, programming language, and Web Socket functionality respectively. Meanwhile Tailwind provides a clean and minimal way to apply styling to the markup and AlpineJs allows for a simple way to add JavaScript functionality directly in the markup.

## Deployment

When searching for a way to deploy my site it was essential to find a hosting provider that Elixir is first class on in terms of features and reasonable pricing - [Gigalixir](https://www.gigalixir.com/) fits this perfectly as it provides a full featured PAAS platform developed specifically for Elixir and used by many large companies. The only caveat is that it can be somewhat pricey relative to "bare metal" hosting but its well worth for small teams due to the time savings alone with how much is included.

[More info can be found here](https://gigalixir.readthedocs.io/en/latest/)

Another option that may be looked into in the future is: [Render](https://render.com/) <br> it's a PAAS that allows for simple deploys at a good price (cheaper than Gigalixir albeit lacking some features like remote login). Some drawbacks to consider is that while the CDN is distributed globally, at the time of writing the server hosting locations are limited to Oregon, USA and Frankfurt, Germany as Render hosts on their own hardware.

[This guide](https://render.com/docs/deploy-elixir-cluster) provides more information.

