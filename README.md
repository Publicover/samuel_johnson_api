# RESTful API: Samuel Johnson's Dictionary from 1755

This is an RoR app in API mode that returns terms from Samuel Johnson's Dictionary in JSON. The app lives on https://samueljohnsonapi.herokuapp.com. (It's on the free tier, so it might take a second to spin up.) Since it is in API-only mode, there is no front page on heroku, so don't be surprised if the link says the app does not exist. It uses token-based authentication with JWT.

Users do not have to create a login to use the API since the following credentials have been provided. Include this information in the request header, and include the web token as well. Users must POST to /auth/login to generate a token that will expire in 24 hours. The public name, email and pass are:  

* guest
* honorsystem(at)nice.com
* plznohacks

If you'd like your own unique credentials, POST name, email and a pw in the request body to /signup. Then POST those credentials in the header to /auth/login per usual.

A GET request to /words/index will return 10 random selections. A GET request to /words/:entry will return a word and definition as one object. Since the dictionary isn't going to change any time soon, the actions create, update and delete are not available to users (though they are in the test suite and error handling system, just in case there's reason to bring them back in the future). 

Searches should be done for the word in question. Note that spelling has changed for a few words in the past 150 years. Also, the dictionary uses parenthesis to differentiate between verb tenses, synonymns and senses so, for example, different results will be returned for "A", "A (abbreviation)" and "A (article)."

Documentation for this API coming soon. A more traditional website hosting the digitized version is at johnsonsdictionaryonline.com and is the inspiration for this project. 
