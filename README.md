As a user

TO DO IMPORTANT FRONT END
- [x] NAVBAR goed stylen//  check padding?
- [x] KNIKKER weghalen bij de NAVBAR
- [x] Add picture on facebook for chicken
- [x] box shadow for all images: from product hunt!
- [x] Check flash messages: they are behind the view and too broad! position absolute rught 0, top 0 left 0!
- [x] Week 1 on top of title not below it. no margin bottom, margin top: 30;
- [x] add `target="_blank"` on link to challenge in mailer
- [x] nice styling to logged hours on avatar
- [x] Add `letter-spacing:2px;` on avatar
- [x] if photo is size 2: made it smaller
- [x] after Deadline: winner met eind score on show challenge & index! font awesome beker naast naam winnaar!!
- [x] Improve button on edit form (style from new_challenge)
- [x] If you do not enter correct information in edit_challenge it reloads the page without the proper background color, why?
- 
MICHÈLE
- [ ] Goed kijken naar de afronding van de getallen van de wager: centen klein ernaast
- [ ] BEFORE and AFTER starting : not able to log times
- [ ] Database opnieuw inrichten met dummy content
- [ ] before starting: on show, show startdate!
- [ ] Challenger has not yet accepted flash-alert message do not show this on preview_challenge page
- [ ] Reverse order of challenges shown on dashboard to latest first (instead of oldest first)
- [ ] show_challenge javascript submit logged_hours 'save' should close whoop container create.js.erb or refresh the page

LARS
- [ ] The dashboard is nice and shows part of your profile, my own activity, I can list my challenges
- [ ] Make dashboard responsive
- [ ] fix accept/decline/delete/concede buttons in dashboard
- [x] Login < alles weg behalve FACEBOOK
- [ ] Remove margin-top on show_challenge to get rid of the ugly, ugly white bars everywhere
- [ ] Logo missing a slash in the mail, fix margins to remove tons and tons of whitespace
- [ ] Redesign dropdown topright corner into branding style
- [ ] new_challenge change javascript to ignore period (.) in e-mail addresses
- [ ] edit_challenge change active_state on submit button to get rid of ugly black border (text-decoration:none)
- [ ] investigate ugly white bars between challenge_show and whoop add_logged_times thingy
- [x] Add padding to alert-flash messages on mobile
- [x] Make it so all the javascript update on new_challenge on keydown, so when you 'tab' in your email it still registers it at the point you enter the amount.


LENA
- [ ] Implement new copy






TO DO MISC
- [x] Add wager description and name to email in some relevant way, somewhere, maybe.
- [ ] Test challenge from creation to completion (winner, checkpoints etc.)
- [ ] test with token sending

TO DO IMPORTANT COPY:
- [x] Formulate questions new challenge
- [x] formulate questions and fillers edit challenge
- [x] formulate challenge preview
- [x] formulate mailer content
- [x] think of dummy activities for presentation
- [x] think of what story to tell during presentation

MAILER
- [x] Add styling to email
- [x] Make template for how we email the Checkpoints 
- [x] Make template for end score: after week 4: who is winner and who lost!

TO DO IMPORTANT BACK END
- [x] User should be able to log out (INVALID AUTHENTICITY TOKEN, the change you wanted was rejected)
- [x] the logged hours should be seen on the photo 
- [x] Add link from email to challenge with token 
- [x] name_challenger visible untill chalenge is accepted

- [x] SUMMARY na de drie vragen voor je op SEND drukt
- [x] I get weekly updates through email (email verification api verhaal)

DONE:
- [x] VALIDATIONS!!!!
- [x] NAVBAR goed doorlinken
- [x] Check if email works!
- [x] CREATE>JS>ERB goed fixen: gelogde tijden hebben meteen invloed op de image, niet na reload!! 

- [x] create a migration to change datetime to date!!!
- [x] CREATE CHALLENGE CONTROLLER : 
- [x] I can create a challenge: (Challlenger controller new + create) 
- [x] edit a challenge
- [x]  in which I can invite  a friend by email
- [x] with the wager and the wager should have a amount / description / name
- [x] with a deadline 
- [x] with an allotment
- [x] with an opponent
- [x] with an activity
- [x] with a name 

- [x] I can accept a challenge (challenge controller accept)
- [x] I can decline a challenge(challenge controller decline)
- [x] I can concede a challenge(challenge controller concede)
 
- [x] I can route to my dashboard!
- [x] I can login (devise login)
- [x] I can signup by creating a profile with email, foto, name(or FB) (devise signup through FB Omiauth)
 
- [x] I can see a challenge (with my current score, my opponents score and my activity)(Challenge controller Show)
- [x] I can log my hours spend on the activity (Logged_time controller new usage of Ajax if possible(see lecture reviews) )

'''''' 
Extra's - /  In which I can discuss the allotment and deadline / // I can edit my profile // // I can negotiate the terms(deadline, allotment, wager) of the challenge //

''''' 
___________________________________________________________

EXTRA TO DO :

- [x] Change the end date to dd/mm/yy instead of a full stamp!! Figure out why it is going back in time three days
- [x] edit and new challenge: styling
- [x] show challenge: balken moeten kloppen, + score meter
- [x] Pagina maken waar vanuit de mail wordt doorgelinkt om zo te kunnen accepteren of afwijzen (routes)
- [x] NAVBAR staat nog op stand waarbij het iets moet doen als ie klein word (colom xs die reageert ergens)
- [x] waarden in show aanpassen aan ingevulde velden
- [x] my logged hours change the size of my image
- [x] Start date not in the past!
- [x] Changing of the image should have a maximum
- [ ] Also send the creator an e-mail if the challenger has accepted



_________________________________________________________



# MoSCoW
## Must have: 
create a user//
Invite a second user//
Creation of Challenge//
See challenge//
Log time spent//
See score//

## Should have
fancy stats @ index
list challenges
FB login 
Email notifications
Chat with opponent

## Could have 
Ajax time logging
Ajax chatting
Dynamic altered visual score
Dynamic examples of activities 

## Would have 
FIREWORK ANIMATIONS when you won
Animated button 
Membership program
Challenge multi players
Create more months for a challenge
Business model
payment system 
Possibility of challenging unknown people
possibility of challenging someone with a different activity


