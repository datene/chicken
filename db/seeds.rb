User.destroy_all
Challenge.destroy_all


abel = User.create!(first_name: "Abel", last_name: "Smith", picture: "http://creativestockphoto.com/wp-content/uploads/2014/10/images-of-man-and-woman-in-love.jpg", email: "bla1@bla.com", password: "whatever")
lara = User.create!(first_name: "Lara", last_name: "Davis", picture: "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTDKkh_6G8ybkhWBHCExCqy7LUiNfSwejWLOr5xUCDXM0cGMbln", email: "bla2@bla.com", password: "whatever")
michele = User.create!(first_name: "Michele", last_name: "de Bruyn", picture: "http://lewagon.github.io/amsterdam/images/batches/batch-20/michele.jpg", email: "debruyn.mm@gmail.com", password: "whatever")
lena = User.create!(first_name: "Lena", last_name: "Hartog", picture: "http://lewagon.github.io/amsterdam/images/batches/batch-20/lena.jpg", email: "lenahartog@gmail.com", password: "whatever")
lars = User.create!(first_name: "Lars", last_name: "Bohm", picture: "http://lewagon.github.io/amsterdam/images/batches/batch-20/lars.jpg", email: "larsbohm@gmail.com", password: "whatever")

lena_michele = Challenge.create!(creator: lena, challenger: michele, name: 'Reading Challenge', activity: 'reading', wager_amount: 50, wager_description: 'Dinner after', allotment: 3, status: 'accepted',start_date: "2016-03-02", deadline: "2016-03-30")
lara_lena = Challenge.create!(creator: lara, challenger: lena, name: 'Running Challenge', activity: 'running', wager_amount: 30, wager_description: 'Enter a running competition together', allotment: 4, status: 'accepted', start_date: "2016-02-11", deadline: "2016-03-10")
lena_abel = Challenge.create!(creator: lena, challenger: abel,name: 'Biking Challenge', activity: 'biking', wager_amount: 20, wager_description: 'Get some lunch together', allotment: 5, status: 'accepted', start_date: "2016-03-21", deadline: "2016-04-18")
# Challenge.create!(name: 'Painting Challenge', activity: 'painting', wager_amount: 60, wager_description: 'Together go to an art exhibition',  allotment: 2, status: 'accepted', deadline: Date.today + 4.weeks, start_date: Date.today )
# Challenge.create!(name: 'Meditating Challenge', activity: 'meditate', wager_amount: 20, wager_description: 'Go to a yoga class together', allotment: 3, status: 'accepted', deadline: Date.today + 4.weeks, start_date: Date.today )

# lena vs michele 
LoggedTime.create!(challenge: lena_michele, user: lena, created_at: "2016-03-03", amount: 120)
LoggedTime.create!(challenge: lena_michele, user: michele, created_at: "2016-03-04", amount: 120)
Checkpoints::CheckService.new(lena_michele, 5)

# lara vs lena
LoggedTime.create!(challenge: lara_lena, user: lena, created_at: "2016-03-04", amount: 200)
LoggedTime.create!(challenge: lara_lena, user: lara, created_at: "2016-03-05", amount: 50)
Checkpoints::CheckService.new(lara_lena, 5)

#lena vs abel "2016-03-28", deadline: "2016-04-25"
LoggedTime.create!(challenge: lena_abel, user: lena, created_at: "2016-03-29", amount: 120)
LoggedTime.create!(challenge: lena_abel, user: michele, created_at: "2016-03-29", amount: 100)
Checkpoints::CheckService.new(lena_abel, 1)