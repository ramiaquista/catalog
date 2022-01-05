require './music_album'

describe MusicAlbum do
  context 'Creating an instance of a musicAlbum' do
    it 'should create a new instace of a musicAlbum' do
      music_album = MusicAlbum.new('22/02/2022')
      expect(music_album.on_spotify).to eq(false)
    end
    it 'should return false when  the publish date is less than 10 years' do
      music_album = MusicAlbum.new('22/02/2022')
      expect(music_album.can_be_archived?).to eq(false)
    end
    it 'should return true when the publish date is more than 10 years and on_spotify true' do
      music_album = MusicAlbum.new('22/02/2002', on_spotify: true)
      expect(music_album.can_be_archived?).to eq(true)
    end
    it 'should return false  when the publish date is more than 10 years and on_spotify false' do
      music_album = MusicAlbum.new('22/02/2002', on_spotify: false)
      expect(music_album.can_be_archived?).to eq(false)
    end
  end
end
