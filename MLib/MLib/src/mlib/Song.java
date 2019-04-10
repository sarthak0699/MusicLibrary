/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mlib;

/**
 *
 * @author sarthak
 */
class Song {
    
    private String name,artist,album,year,genre;
    private int id,count;
    Song(String name,String artist,String album,String year,int id)
    {
        this.name=name;
        this.artist=artist;
        this.album=album;
        this.year=year;
        this.id=id;
             
    }
    Song(String name,String genre,int count)
    {
        this.name=name;
        this.genre=genre;
        this.count=count;
    }
    Song(String name,int count)
    {
        this.name=name;
        this.count=count;
    }
    
    public String getName()
    {
        return name;
    }
    public String getArtist()
    {
        return artist;
    }
    public String getAlbum()
    {
        return album;
    }
    public String getYear()
    {
        return year;
    }
    public int getId()
    {
        return id;
    }
    public int getCount()
    {
        return count;
    }
    public String getGenre()
    {
        return genre;
    }
}
