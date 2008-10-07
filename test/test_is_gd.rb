require File.dirname(__FILE__) + '/test_helper.rb'

class TestIsGd < Test::Unit::TestCase
  FIXTURES_FILE = File.dirname(__FILE__) + '/fixtures.yaml'
  
  def test_google_minify
    is_gd_url = IsGd.minify(@fixtures["google_one"]["original_url"])
    assert_equal(@fixtures["google_one"]["is_gd_url"], is_gd_url, "#{@fixtures["google_one"]["is_gd_url"]} does not equal #{is_gd_url} which was minified from #{@fixtures["google_one"]["original_url"]}.")
    
    is_gd_url = IsGd.minify(@fixtures["google_two"]["original_url"])
    assert_equal(@fixtures["google_two"]["is_gd_url"], is_gd_url, "#{@fixtures["google_two"]["is_gd_url"]} does not equal #{is_gd_url} which was minified from #{@fixtures["google_two"]["original_url"]}.")
  end
  
  
  def test_google_two_un_minify
    un_minified_url = IsGd.un_minify(@fixtures["google_two"]["is_gd_url"])
    assert_equal("http://" +@fixtures["google_two"]["original_url"], un_minified_url, "#{@fixtures["google_two"]["is_gd_url"]} was supposed to turn into #{@fixtures["google_two"]["original_url"]}, but it didn't. It turned into #{un_minified_url}" )
  end
  
  def setup
    @fixtures = YAML::load( File.open( FIXTURES_FILE ) )
  end
end
