require 'test/unit'
class Song
	attr_writer :duration
	def initialize(name, artist, duration)
		@name = name
		@artist = artist
		@duration = duration
	end
	def name
		@name
	end
	def artist
		@artist
	end

	def duration
		@duration
	end
	def duration_in_minutes
		(@duration/60).to_i
	end
	def duration_in_minutes= (new_duration)
		@duration = (new_duration*60).to_i
	end
end
class SongList
	def initialize
		@songs = Array.new
	end
	def append(song)
		@songs.push(song)
		self
	end
	def delete_first
		@songs.shift
	end
	def delete_last
		@songs.pop
	end
	def [](index)
		@songs[index]
	end
	def with_title(title)
		@song.find{|song| title == song.name}
		
end




class TestSongList < Test::Unit::TestCase
	def test_delete
		list = SongList.new
		s1 = Song.new('title1', 'artist1', 1)
		s2 = Song.new('title2', 'artist2', 2)
		s3 = Song.new('title3', 'artist3', 3)
		list.append(s1).append(s2).append(s3)
		assert_equal(s1, list[0])
		assert_equal(s3, list[2])
		assert_nil(list[9])
		assert_equal(s1, list.delete_first)
		assert_equal(s3, list.delete_last)
		assert_equal(s2, list.delete_first)
		assert_nil(list.delete_last)
	end
end