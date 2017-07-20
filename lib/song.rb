require "pry"

class Song
  attr_accessor :name, :artist_name

  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    # self.new.save
    new_song = self.new
    new_song.save
    new_song
  end

  def self.new_by_name(title)
    new_song = self.create
    new_song.name = title
    new_song
  end

  def self.create_by_name(title)
    new_song = self.create
    new_song.name = title
    new_song
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by {|element| element.name}
  end

  def self.new_from_filename(file)
    file = file.split(" - ")
    temp = self.new_by_name(file[1].chomp(".mp3"))
    temp.artist_name = file[0]
    temp
  end

  def self.create_from_filename(file)
    file = file.split(" - ")
    temp = self.new_by_name(file[1].chomp(".mp3"))
    temp.artist_name = file[0]
    temp
  end

  def self.destroy_all
    @@all = []
  end
  #binding.pry
end
