require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Things::Area" do

  before do
    @area = Things::Area.new(:name => 'TEST - Foo')
  end
  
  describe "#self.new" do
      
    it "should create a new Things::Area instance with properties" do      
      @area.name.should == "TEST - Foo"
    end
    
    it "should not be sent to Things yet" do
      @area.id_.should == nil
      Things::App.instance.areas.get.collect { |area| area.name.get }.should_not include("TEST - Foo")
    end
    
  end
  
  describe "#new?" do

    it "should return whether the instance is new or not" do
      @area.new?.should == true
    end
    
  end
  
  describe "#save" do
    
    before do
      @area.save
    end
    
    after do
      @area.delete
      Things::App.instance.empty_trash
    end
    
    describe "on a new area" do

      it "should create the area" do
        @area.id_.should_not be_nil
        @area.new?.should == false
        
        Things::App.instance.areas.get.collect { |area| area.name.get }.should include("TEST - Foo")
      end
      
    end
    
    describe "on an existing area" do
      it "should update the area" do
        @area.name = 'TEST - Boo'
        @area.save
        @found = Things::Area.find_by_id(@area.id_)
        @found.name.should == 'TEST - Boo'
      end
    end
    
  end
  
  describe '#create' do

    before do
      @area.delete
      Things::App.instance.empty_trash
    end

    after do
      @area.delete
      Things::App.instance.empty_trash
    end
    
    it "should create a new area based on supplied properties" do
      @area = Things::Area.create(:name => 'TEST - Goo')
      @area.new?.should == false
      @area.id_.should_not be_nil
      @area.name.should == 'TEST - Goo'
    end
    
    
  end
  
  describe '#delete' do
    
    before do
      @area.save
      Things::App.instance.areas.name.get.should include(@area.name)
    end
    
    it "should remove a area" do
      @area.delete
      Things::App.instance.empty_trash
      Things::App.instance.areas.name.get.should_not include(@area.name)      
    end
    
  end
  
  describe 'finding' do

    before do
      @area.save
    end
    
    after do
      @found.class.should == Things::Area
      @found.id_.should == @area.id_
      @found.name.should == @area.name
      
      @area.delete
      Things::App.instance.empty_trash
    end
    
    describe '#find_by_name' do

      it "should find a area based on its name" do
        @found = Things::Area.find_by_name('TEST - Foo')
      end

    end
    
    describe '#find_by_id' do

      it "should find a area based on its id" do
        @found = Things::Area.find_by_id(@area.id_)
      end

    end
    
    describe '#find' do
      it "should find a area based on its name" do
        @found = Things::Area.find('TEST - Foo')
      end
      
      it "should find a area based on its id" do
        @found = Things::Area.find(@area.id_)
      end
    end
    
  end
  
  describe '#todos' do
    
    before do
      @foo = Things::Todo.new(:name => 'TEST - Foo')
      @bar = Things::Todo.new(:name => 'TEST - Bar')
    end
    
    after do
      @foo.delete
      @bar.delete
      Things::App.instance.empty_trash
    end
    
    it "should get todo assigner to a area" do
      @area.save
      @foo.area= @area
      @foo.save
      @foo.area.should == @area
      @area.delete
    end
    
    # Reported by http://github.com/marcinbunsch/things-client/issues/1
    it "should maintain association to area on update" do
      @area.save
      @area = Things::Area.find(@area.name)
      @todo = Things::Todo.new(:name => 'TestTODO')
      @todo.area= @area
      @todo.save
      @todo.area.should == @area
      @todo = Things::Todo.find(@todo.name)
      @todo.area= @area
      @todo.save
      @todo = Things::Todo.find(@todo.name)
      @todo.area.name.should == @area.name
      @area.delete
      @todo.delete
    end
    
  end
  
  

end