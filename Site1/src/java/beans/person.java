/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

import java.io.Serializable;

/**
 *
 * @author ch
 */
public class person implements Serializable {

    private String firstName;
    private String lastName;
    private String emailId;
    private String password;
    private String proPhoto;
    private String pproPhoto;
    private String covPhoto;
    private String pcovPhoto;
    private double postid;
    private String post;
    private String pic;
    private String time;

    public person() {
        this.firstName = "";
        this.lastName = "";
        this.emailId = "";
        this.password = "";
        this.proPhoto = "";
        this.pproPhoto = "";
        this.covPhoto = "";
        this.pcovPhoto = "";
        this.postid = 0;
        this.post = "";
        this.pic = "";
        this.time = "";

    }

// setters
    public void setEmailId(String e) {
        this.emailId = e;
    }

    public void setPostId(double p) {
        this.postid = p;
    }

    public void setPost(String p) {
        this.post = p;
    }

    public void setPic(String p) {
        this.pic = p;
    }

    public void setPassword(String p) {
        this.password = p;
    }

    public void setProPhoto(String pro) {
        this.proPhoto = pro;
    }

    public void setPublicProPhoto(String ppro) {
        this.pproPhoto = ppro;
    }

    public void setCovPhoto(String cov) {
        this.covPhoto = cov;
    }

    public void setPublicCovPhoto(String pcov) {
        this.pcovPhoto = pcov;
    }

    public void setFirstName(String f) {
        this.firstName = f;
    }

    public void setLastName(String l) {
        this.lastName = l;
    }

    public void setTime(String t) {
        this.time = t;
    }

// getters
    public String getEmailId() {
        return this.emailId;
    }

    public String getTime() {
        return this.time;
    }

    public double getPostId() {
        return this.postid;
    }

    public String getPost() {
        return this.post;
    }

    public String getPic() {
        return this.pic;
    }

    public String getPassword() {
        return this.password;
    }

    public String getCovPhoto() {
        return this.covPhoto;
    }

    public String getPublicCovPhoto() {
        return this.pcovPhoto;
    }

    public String getProPhoto() {
        return this.proPhoto;
    }

    public String getPublicProPhoto() {
        return this.pproPhoto;
    }

    public String getFirstName() {
        return this.firstName;
    }

    public String getLastName() {
        return this.lastName;
    }

} // end class Person
