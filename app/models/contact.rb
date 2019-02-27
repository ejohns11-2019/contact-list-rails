class Contact < ApplicationRecord
  #Associations
  #belongs_to
  #has_many
  #has_one
  #has_many :through
  #has_one :through
  #dependent

  has_many :notes, dependent: :destroy #when delete contact it should delete all of the notes
   #name of association and table name
  #many notes per one contact relation is has_many
  #to make a note have to make a contact first
  has_one :address, dependent: :destory #when delete something delete all of its children

  #Validations - want to set restrictions before create contacts/address
    # confirmation
      # validates :password, confirmation: true
      #have to specify confirmation here and inside of controllers
        #inside of a form:
        # <%= text_field :password, %>
        # <%= text_field :password_confirmation, %> must have 2 fields in form

    # inclusion
      #validates attribute values that are included inside a particular case
    #   class Coffee < ActiveRecord::Base
    #   validates :size, inclusion: {
    #     in: %w(small medium large), #%w sets an array
    #       message: "%{value} is not a valid size"
    #   }
      # end

    # length
      #specifies how big column can be
      # validates :phone, length: {maximum: 10} #max 10chars
      # validates :phone, length: {minimum: 7}
      validates :phone, length: {in 7..10} #sets range
      # validates :phone, length: {is 7} #length is 7chars

    # numericality
      #make sure input is a numeric value
      # validates :age, numericality: true
      # validates :age, numericality: {only_integer: true}
      validates :age, numericality: {
        greater_than_or_equal_to: 21,
        less_than_or_equal_to: 150
      }

    # presence
      #for record to be made must fill out certain columns
      validates
        :age,
        :phone,
        :email,
        :first_name,
        :last_name,
      presence: true, on :create
      # on: :update
      # on: :save
       #only verify presence on create CRUD action
        #validates that all of these columns are present with values

    # uniqueness
      validates :email, uniqueness: true, allow_nil: true #can leave this blank if allow nil
      #make sure no values for email are the same

  #VALIDATION OPTIONS
    #allow_nil - nil
    #allow_blank - does nil ' ' ie. nil with emply string, allow_blank: false
    #message - throws a msg back to user when put invalid input see coffee ex above
    #on - attach in or behind validations to restrict database

  #CALLBACKS
    #triggers a method once does a particular action
    # before_validation
    # after_validation
    # before_save
    # after_save
    # around_save - around the same time as this action
    # before_create
    # after_create
    # around_create

      before_save :set_age #before do save do set_age first

      private #this stuff only pertains to this particular file
        def set_age
          self.age = 18
        end

    # serialize :cart, Array #in grocery cart project, storing all items in column cart in array
      # #can pull multiple values inside of array cart
      # cart
      # []

    #CLASS METHODS
      def self.by_first_name
        order(:first_name)
        #pertains to the entire table
        #call this way: Contact.by_first_name
        #self here is entire contacts
      end

    #INSTANCE METHODS
      # def full_name
        "#{self.first_name} #{self.last_name}"
        #only pertains to certain instance/record of it
        #call this way: @person.full_name
        #self is the current object/instance. first and last name of the specific contact
      # end
end
