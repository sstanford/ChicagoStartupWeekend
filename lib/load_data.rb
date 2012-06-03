module LoadData
  def self.load
    PayLevel.all.each do |pl|
      pl.destroy
    end
    PayLevel.create!( amount: 1,
                      photo_url: 'http://www.belated.co/granny.gif',
                      description: 'Test description',
                      message: "I'm a bit of a jerk",
                      name: 'Test name')
    PayLevel.create!( amount: 2,
                      photo_url: '',
                      description: '',
                      message: "'I'm sorta of a jerk",
                      name: '')
    PayLevel.create!( amount: 5,
                      photo_url: '',
                      description: '',
                      message: "'I'm a jerk",
                      name: '')
    PayLevel.create!( amount: 10,
                      photo_url: '',
                      description: '',
                      message: "'I'm really a jerk",
                      name: '')
    PayLevel.create!( amount: 20,
                      photo_url: '',
                      description: '',
                      message: "'I'm an asshole",
                      name: '')

  end
end
