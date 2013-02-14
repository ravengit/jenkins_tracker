module FixtureLoader

  def load_fixture_as_str(filename)
    File.read(fixture_file_path(filename))
  end

  def fixture_file_path(filename)
    File.join(PROJECT_ROOT, 'spec', 'fixtures', filename)
  end

end