As a user

TO DO IMPORTANT FRONT END
- [x] NAVBAR goed stylen//  check padding?
- [x] KNIKKER weghalen bij de NAVBAR
- [x] Add picture on facebook for chicken
- [x] box shadow for all images: from product hunt!
- [x] Check flash messages: they are behind the view and too broad! position absolute rught 0, top 0 left 0!
- [x] Week 1 on top of title not below it. no margin bottom, margin top: 30;
- [ ] if photo is size 2: padding right left? 30px?
- [ ] The dashboard is nice and shows part of your profile, my own activity, I can list my challenges
- [ ] nice styling to logged hours on avatar
- [ ] Add `letter-spacing:2px;` on avatar
- [ ] after Deadline: winner met eind score
- [ ] add `target="_blank"` on link to challenge in mailer
- [ ] Goed kijken naar de afronding van de getallen van de wager: centen klein ernaast

MAILER
- [ ] Add styling to email
- [x] Make template for how we email the Checkpoints 
- [ ] Make template for end score: after week 4: who is winner and who lost!

TO DO IMPORTANT BACK END
- [x] User should be able to log out (INVALID AUTHENTICITY TOKEN, the change you wanted was rejected)
- [x] the logged hours should be seen on the photo 
- [x] Add link from email to challenge with token 
- [ ] test with token sending
- [x] name_challenger visible untill chalenge is accepted

- [ ] SUMMARY na de drie vragen voor je op SEND drukt
- [x] I get weekly updates through email (email verification api verhaal)
- 
REMOVEEEEEE
- [ ] I can chat to my opponents (messages controller index new destroy)
- [ ] knikker op navbar alleen laten zien als we nog messages toevoegen

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


