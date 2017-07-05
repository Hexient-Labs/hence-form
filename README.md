[![Code Climate](https://codeclimate.com/github/Hexient-Labs/hence-form/badges/gpa.svg)](https://codeclimate.com/github/Hexient-Labs/hence-form)
[![Issue Count](https://codeclimate.com/github/Hexient-Labs/hence-form/badges/issue_count.svg)](https://codeclimate.com/github/Hexient-Labs/hence-form)
[![Test Coverage](https://codeclimate.com/github/Hexient-Labs/hence-form/badges/coverage.svg)](https://codeclimate.com/github/Hexient-Labs/hence-form/coverage)
[![Build Status](https://travis-ci.org/Hexient-Labs/hence-form.svg?branch=master)](https://travis-ci.org/Hexient-Labs/hence-form)
[![Open Source Love](https://badges.frapsoft.com/os/v2/open-source.svg?v=103)](https://github.com/ellerbrock/open-source-badges/)
[![GPL Licence](https://badges.frapsoft.com/os/gpl/gpl.svg?v=103)](https://opensource.org/licenses/GPL-3.0/)

<p align="center">
  <img src="readme_images/logo_250.png">
</p>

# Hexient Labs HenceForm

* [Overview](#overview)
* [Deployment](#deployment)
* [Running Locally](#running-locally)
* [License](#license)
* [Contributions](#contributions)

## Overview

Have you ever needed to set up a PHP script to relay form submissions to your email?
Well, you should use your HenceForm!

Just create a form on your site and set the `action` attribute on your form
to `https://henceform.hexientlabs.com/you@youremail.com`. Then whenever a user
fills out and submits the form, we'll send you an email with that data.

A form could look like:

```html
<form action="https://henceform.hexientlabs.com/you@youremail.com">
  <input type="text" name="first_name"/>
  <input type="text" name="last_name"/>
  <button type="submit">Submit</button>
</form>
```

The first time you submit a form, it will ask you to confirm your email.
After that, you're good to go.

## Deployment

Want to run your own copy of HenceForm? It's simple.

Use the Heroku Deploy button below and set the required configuration
values on the next page

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)

This project is heavily inspired by the amazing
[FormSpree](https://www.formspree.io) project.

# Running Locally

# License

This project is licensed under the [GPL v3 License](./LICENSE)

# Contributions

![Hexient Labs Logo](readme_images/logo_140.png)

This project is lovingly maintained by the [Hexient Labs](https://www.hexientlabs.com)
Engineering Team. If you like this project, consider them for your your next project


