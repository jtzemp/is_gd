require File.dirname(__FILE__) + '/test_helper.rb'

class TestIsGd < Test::Unit::TestCase
  FIXTURES_FILE = File.dirname(__FILE__) + '/fixtures.yaml'
  
  def test_google_minify
    minify(@fixtures["google_one"]["original_url"], @fixtures["google_one"]["is_gd_url"])
    minify(@fixtures["google_two"]["original_url"], @fixtures["google_two"]["is_gd_url"])
  end
  
  def test_google_two_un_minify
    un_minify(@fixtures["google_two"]["is_gd_url"], "http://" + @fixtures["google_two"]["original_url"])
  end
  
  def test_google_maps
    minify(@fixtures["google_maps"]["original_url"], @fixtures["google_maps"]["is_gd_url"])
    un_minify(@fixtures["google_maps"]["is_gd_url"], @fixtures["google_maps"]["original_url"])
  end
  
  def test_apache_docs_pound_sign
    minify(@fixtures["apache_docs"]["original_url"], @fixtures["apache_docs"]["is_gd_url"])
    un_minify(@fixtures["apache_docs"]["is_gd_url"], @fixtures["apache_docs"]["original_url"])
  end
  
  def setup
    @fixtures = YAML::load( File.open( FIXTURES_FILE ) )
  end
  
  def minify(original_url, is_gd_url)
    minified_url = IsGd.minify(original_url)
    assert_equal(is_gd_url, minified_url, "#{is_gd_url} does not equal #{minified_url} which was minified from #{original_url}.")
  end

  def un_minify(is_gd_url, original_url)
    un_minified_url = IsGd.un_minify(is_gd_url)
    assert_equal(un_minified_url, original_url, "#{is_gd_url} was supposed to turn into #{original_url}, but it didn't. It turned into #{un_minified_url}")
  end
end

