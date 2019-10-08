ron = User.create(name: "Ron Swanson", username: "rswanson7", email: "ron@parks.com", password: "rspass", location: "Pawnee, IN", bio: "Libertarian. I will probably never use this app but thanks to Leslie, the government now has even more info about me...")
leslie = User.create(name: "Leslie Knope", username: "lknope5", email: "leslie@parks.com", password: "lkpass", location: "Pawnee, IN", bio: "Parks and Rec. One day I'll be the first woman president.")
ann = User.create(name: "Ann Perkins", username: "aperkins8", email: "ann@parks.com", password: "appass", location: "Pawnee, IN", bio: "I'm Ann Perkins. I'm a nurse. Relationship status: always complicated.")
tom = User.create(name: "Tom Haverford", username: "tommyboy", email: "tom@parks.com", password: "thpass", location: "Pawnee, IN", bio: "Treat yo self.")
april = User.create(name: "April Ludgate", username: "janetsnakehole", email: "april@ludgate.com", password: "alpass", location: "Pawnee, IN", bio: "This is stupid. Leslie is stupid.")
andy = User.create(name: "Andy Dwyer", username: "burtmacklinFBI", email: "andy@parks.com", location: "Pawnee, IN", password: "adpass", bio: "There's only one man for any dangerous job... and that's Burt Macklin, FBI. Lol jk. Leslie made me make this account. Also feel free to reach out to my email to book my band. It's awesome. Check us out. Formerly known as Mouse Rat. Currently looking for a new band name.")
ben = User.create(name: "Ben Wyatt", username: "bwyatt7", email: "ben@parks.com", password: "bwpass", location: "Pawnee, IN", bio: "I love Leslie. Leslie - this was a great idea honey! You're gonna make a great president one day. Very organized.")


ron_private = Group.create(name: "My Tasks", info: "Your personal task group. Feel free to customize however you choose.")
ron_private.owner = ron
ron_private.save

leslie_private = Group.create(name: "My Tasks", info: "Your personal task group. Feel free to customize however you choose.")
leslie_private.owner = leslie
leslie_private.save

ann_private = Group.create(name: "My Tasks", info: "Your personal task group. Feel free to customize however you choose.")
ann_private.owner = ann
ann_private.save

tom_private = Group.create(name: "My Tasks", info: "Your personal task group. Feel free to customize however you choose.")
tom_private.owner = tom
tom_private.save

april_private = Group.create(name: "My Tasks", info: "Your personal task group. Feel free to customize however you choose.")
april_private.owner = april
april_private.save

andy_private = Group.create(name: "My Tasks", info: "Your personal task group. Feel free to customize however you choose.")
andy_private.owner = andy
andy_private.save

ben_private = Group.create(name: "My Tasks", info: "Your personal task group. Feel free to customize however you choose.")
ben_private.owner = ben
ben_private.save

parks_team = Group.create(name: "Park and Rec Avengers", info: "Ron didn't want me to create this group but HA in your face Ron -- Leslie.")
parks_team.owner = leslie
parks_team.members = [ron, ann, andy, april, ben, tom]
parks_team.save

halloween_party = Task.create(title: "Halloween Party", complete?: false)
decor = SubTask.create(content: "buy decorations", complete?: false)
food = SubTask.create(content: "make spooky food", complete?: false)
host = SubTask.create(content: "convince Ron to let us host at his place", complete?: false)
costumes = SubTask.create(content: "make sure Leslie has the best costume", complete?: false)

halloween_party.sub_tasks = [decor, food, host, costumes]
halloween_party.group = parks_team
halloween_party.save

clean_park = Task.create(title: "Clean up Park by Ann's House", complete?: false)
town_hall = SubTask.create(content: "host a town hall", complete?: false)
tools = SubTask.create(content: "pick up proper tools", complete?: false)
fundraising = SubTask.create(content: "canvas town for more funding", complete?: false)
labor = SubTask.create(content: "go to work and clean that park!", complete?: false)

clean_park.sub_tasks = [town_hall, tools, fundraising, labor]
clean_park.group = parks_team
clean_park.save
