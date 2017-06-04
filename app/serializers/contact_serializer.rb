class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :birthdate, :created_at

  belongs_to :kind do
    link(:related) { kind_url object.kind.id }
  end

  has_many :phones
  has_one :address

  def attributes(*args)
    json = super(*args)
    json[:birthdate] = object.birthdate.to_time.iso8601 unless object.birthdate.blank?
    json
  end
end
