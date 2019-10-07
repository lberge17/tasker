ron = User.create(name: "Ron Swanson", username: "rswanson7", email: "ron@parks.com", password: "rspass")
leslie = User.create(name: "Leslie Knope", username: "lknope5", email: "leslie@parks.com", password: "lkpass")
ann = User.create(name: "Ann Perkins", username: "aperkins8", email: "ann@parks.com", password: "appass")
tom = User.create(name: "Tom Haverford", username: "tommyboy", email: "tom@parks.com", password: "thpass")
april = User.create(name: "April Ludgate", username: "janetsnakehole", email: "april@ludgate.com", password: "alpass")
andy = User.create(name: "Andy Dwyer", username: "burtmacklinFBI", email: "andy@parks.com", password: "adpass")
ben = User.create(name: "Ben Wyatt", username: "bwyatt7", email: "ben@parks.com", password: "bwpass")


ron_private = Group.create(name: "My Tasks")
ron_private.owner = ron
ron_private.save

leslie_private = Group.create(name: "My Tasks")
leslie_private.owner = leslie
leslie_private.save

ann_private = Group.create(name: "My Tasks")
ann_private.owner = ann
ann_private.save

tom_private = Group.create(name: "My Tasks")
tom_private.owner = tom
tom_private.save

april_private = Group.create(name: "My Tasks")
april_private.owner = april
april_private.save

andy_private = Group.create(name: "My Tasks")
andy_private.owner = andy
andy_private.save

ben_private = Group.create(name: "My Tasks")
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
