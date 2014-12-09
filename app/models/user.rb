class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
 has_many :photos, dependent: :destroy
   validates :name, presence: true

	has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "subscriber_id",
                                  dependent:   :destroy

	has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "subscribed_id",
                                   dependent:   :destroy


has_many :subscribing, through: :active_relationships, source: :subscribed
has_many :subscribers, through: :passive_relationships, source: :subscriber

 # subscribes a user.
  def subscribe(other_user)
    active_relationships.create(subscribed_id: other_user.id)
  end

  # Unsubscribes a user.
  def unsubscribe(other_user)
    active_relationships.find_by(subscribed_id: other_user.id).destroy
  end

  # Returns true if the current user is subscribing the other user.
  def subscribing?(other_user)
    subscribing.include?(other_user)
  end




end
