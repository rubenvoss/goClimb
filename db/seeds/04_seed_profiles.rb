def seed_profiles(profiles, n)
  # binding.pry
  profiles.each_with_index do |profile, index|
    # if user doesnt have a profile, make one
    if User.find(index + n).profile.nil?
      p = Profile.new(name: profile[:name], crag: Crag.all.sample, user: User.find(index + 1))
      photo = URI.open(profile[:url])
      p.photo.attach(io: photo, filename: "photo.jpg", content_type: "image/jpg")
      p.save
      # binding.pry
      puts "profile for #{p.name} with id #{p.id} created"
    end
  end
end
male_profiles = [
  # first profile is admin
  {
    name: "admin",
    url: "https://res.cloudinary.com/dqdezmage/image/upload/v1662031176/go%20climb%20profile%20pictures/omid-armin-D9RrI5IW9h0-unsplash_50_1_50_joecin.jpg"
  },
  {
    name: "Peter",
    url: "https://res.cloudinary.com/dqdezmage/image/upload/v1662031176/go%20climb%20profile%20pictures/omid-armin-D9RrI5IW9h0-unsplash_50_1_50_joecin.jpg"
  },
  {
    name: "Max",
    url: "https://res.cloudinary.com/dqdezmage/image/upload/v1662030258/go%20climb%20profile%20pictures/mihajlo-sebalj-swfJN1URFzA-unsplash_50_whpy63.jpg"
  },
  {
    name: "Theo",
    url: "https://res.cloudinary.com/dqdezmage/image/upload/v1662029774/go%20climb%20profile%20pictures/petr-slovacek-YqVDdDkdFkw-unsplash_50_1_50_md4jrj.jpg"
  },
  {
    name: "Martin",
    url: "https://res.cloudinary.com/dqdezmage/image/upload/v1662030113/go%20climb%20profile%20pictures/tommy-lisbin-tl88ay2QxLU-unsplash_50_1_50_zjqcmw.jpg"
  },
  {
    name: "Connor",
    url: "https://res.cloudinary.com/dqdezmage/image/upload/v1662031008/go%20climb%20profile%20pictures/tommy-lisbin-zUHe9T8Zsj8-unsplash_50_1_50_kxzwdn.jpg"
  }
]
female_profiles = [
  {
    name: "Marie",
    url: "https://res.cloudinary.com/dqdezmage/image/upload/v1662028670/go%20climb%20profile%20pictures/khamkhor--I-McziCxxM-unsplash_50_wnumu1.jpg"
  },
  {
    name: "Anna",
    url: "https://res.cloudinary.com/dqdezmage/image/upload/v1662029941/go%20climb%20profile%20pictures/emma-smith-9Bv0OzPxcOI-unsplash_50_sgqmmp.jpg"
  },
  {
    name: "Carla",
    url: "https://res.cloudinary.com/dqdezmage/image/upload/v1662030519/go%20climb%20profile%20pictures/frances-gunn-fUpgJKCs1fw-unsplash_50_1_50_tzdwwj.jpg"
  },
  {
    name: "Shannon",
    url: "https://res.cloudinary.com/dqdezmage/image/upload/v1662030692/go%20climb%20profile%20pictures/jason-gardner-el88SU3-AQY-unsplash_50_f0o5w7.jpg"
  },
  {
    name: "Alice",
    url: "https://res.cloudinary.com/dqdezmage/image/upload/v1662030864/go%20climb%20profile%20pictures/elijah-hiett-ai7tP-odA2c-unsplash_1_50_e8pfqj.jpg"
  }
]

# there is a 1 here, because nobody has a profile
seed_profiles(male_profiles, 1)

# there is a 6 here, because there are already 5 Users that have a profile
seed_profiles(female_profiles, 6)