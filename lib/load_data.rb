module LoadData
  def self.load
    PayLevel.create!( amount: 100,
                      photo_url: '',
                      description: '',
                      message: '',
                      name: '')
    PayLevel.create!( amount: 200,
                      photo_url: '',
                      description: '',
                      message: '',
                      name: '')
    PayLevel.create!( amount: 500,
                      photo_url: '',
                      description: '',
                      message: '',
                      name: '')
    PayLevel.create!( amount: 1000,
                      photo_url: '',
                      description: '',
                      message: '',
                      name: '')
    PayLevel.create!( amount: 2000,
                      photo_url: '',
                      description: '',
                      message: '',
                      name: '')

  end
end
