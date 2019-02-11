# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# document = Document.create([{ titlt: 'Document1' }, { body: 'Lord of the Rings' }])
# Character.create(name: 'Luke', movie: document.first)



documents = [
  ["title", "body", "cover", 1]
]

documents.each do |document|
  Document.create(title: document[0], body: document[1], cover: document[2], receiver: document[3])
end


social_accounts = [
  ["title", "body", 1, "login", "password", "action"]
]

social_accounts.each do |social_account|
  SocialAccount.create(title: social_account[0], body: social_account[1], receiver: social_account[2], login: social_account[3], password: social_account[4], action: social_account[5])
end


instructions = [
  ["title", "body", 1]
]

instructions.each do |instruction|
  Instruction.create(title: instruction[0], body: instruction[1], receiver: instruction[2])
end


subscriptions = [
  ["title", "body", 1, "login", "password"]
]

subscriptions.each do |subscription|
  Subscription.create(title: subscription[0], body: subscription[1], receiver: subscription[2], login: subscription[3], password: subscription[4])
end


wallets = [
  ["title", "body", 1, "login", "password"]
]

wallets.each do |wallet|
  Wallet.create(title: wallet[0], body: wallet[1], receiver: wallet[2], login: wallet[3], password: wallet[4])
end
