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
    
    private String name,artist,album,year;
    private int id;
    Song(String name,String artist,String album,String year,int id)
    {
        this.name=name;
        this.artist=artist;
        this.album=album;
        this.year=year;
        this.id=id;
             
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
}
