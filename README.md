# Samuel Johnson's Dictionary from 1755

This is an RoR app in API mode that returns terms from Samuel Johnson's Dictionary in JSON. The app lives on https://samueljohnsonapi.herokuapp.com. Since it is in API-only mode, there is no front page on heroku, so don't be surprised if the link says the app does not exist. 

Users do not have to create a login to use the API since the following credentials have been provided. Include this information in the request header as well as the web token. Users must log in at /auth/login to generate a token that will expire within 24 hours.   

name: guest
email: honorsystem@nice.com
password: plznohacks

Searches should be done for the word in question. Note that spelling has changed for a few words in the past 150 years. Also, the dictionary uses parenthesis to differentiate between verb tenses and homonymns, so, for example, different results will be returned for "A", "A (abbreviation)" and "A (article)."

A more traditional website hosting the digitized version is at johnsonsdictionaryonline.com and is the inspiration for this project. 
