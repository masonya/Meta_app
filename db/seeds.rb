# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# document = Document.create([{ title: 'Document1' }, { body: 'Lord of the Rings' }])
# Character.create(name: 'Luke', movie: document.first)
#
#
#
# documents = [
#   ["title", "body", "cover", 1]
# ]
#
# documents.each do |document|
#   Document.create(title: document[0], body: document[1], cover: document[2], receiver: document[3])
# end
#
#
# social_accounts = [
#   ["title", "body", 1, "login", "password", "action"]
# ]
#
# social_accounts.each do |social_account|
#   SocialAccount.create(title: social_account[0], body: social_account[1], receiver: social_account[2], login: social_account[3], password: social_account[4], action: social_account[5])
# end
#
#
# instructions = [
#   ["title", "body", 1]
# ]
#
# instructions.each do |instruction|
#   Instruction.create(title: instruction[0], body: instruction[1], receiver: instruction[2])
# end
#
#
# subscriptions = [
#   ["title", "body", 1, "login", "password"]
# ]
#
# subscriptions.each do |subscription|
#   Subscription.create(title: subscription[0], body: subscription[1], receiver: subscription[2], login: subscription[3], password: subscription[4])
# end
#
#
# wallets = [
#   ["title", "body", 1, "login", "password"]
# ]
#
# wallets.each do |wallet|
#   Wallet.create(title: wallet[0], body: wallet[1], receiver: wallet[2], login: wallet[3], password: wallet[4])
# end



require 'faker'

start = Time.now

Rake::Task['db:drop'].invoke
Rake::Task['db:create'].invoke
Rake::Task['db:migrate'].invoke


def seed_data
  create_users
  # create_social_accounts
  # create_account_transfers
end

def create_users
  users = [
    ["user1@user1.user1"],
    ["user2@user2.user2"],
    ["user3@user3.user3"]
  ]

  users.each { |user| create_user(user) }
end


def create_user(user)
  password = "123456"

  user = User.create(
    email: user[0],
    password: password,
    password_confirmation: password
  )

  puts "User with id #{ user.id } created"
end




# def create_social_accounts
#   social_accounts = [
#     ["Facebook", "Test Body", "Test Login", "Test Password"],
#     ["Instagram", "Test2 Body", "Test2 Login", "Test2 Password"],
#     ["YouTube", "Test3 Body", "Test3 Login", "Test3 Password"]
# ]
#
# social_accounts.each { |social_account| create_social_account(social_account) }
# end
#
# def create_social_account(social_account)
#
#   social_account = SocialAccount.create(
#     title: social_account[0],
#     body: social_account[1],
#     login: social_account[2],
#     password: social_account[3],
#     user_id: 1
#   )
#
#   puts "SocialAccount with id #{ social_account.id } created"
# end





# def create_account_transfers
#   account_transfers = [
#     ["Fasebook", "Test Body", "Test Login", "Test Password"],
#     ["Instagram", "Test2 Body", "Test2 Login", "Test2 Password"],
#     ["YouTube", "Test3 Body", "Test3 Login", "Test3 Password"]
# ]

# account_transfers.each { |account_transfer| create_account_transfer(account_transfer) }
# end

# def create_account_transfers
# @user1 = User.find_by_email("user1@user1.user1")
# @user3 = User.find_by_email("user3@user3.user3")
# @social_account1 = SocialAccount.find_by_id("1")
#
#   account_transfer = AccountTransfer.create(
#     transmitter_id: @user1.id,
#     transferable_id: @social_account1.id,
#     transferable_type: "SocialAccount",
#     email: "user3@user3.user3",
#     inheritor_id: @user3.id
#   )
#
#   puts "AccountTransfer with id #{ account_transfer.id } created"
# end


seed_data
