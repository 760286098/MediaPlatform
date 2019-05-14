package com.AnalyzeSystem.model;

import java.util.Date;

public class Mp_info {
    private int _id;
    private String name;
    private String wx_hao;
    private String company;
    private String description;
    private String logo_url;
    private String qr_url;
    private Date create_time;
    private Date update_time;
    private String recent_wz;
    private Date recent_time;
    private String wz_url;
    private int last_qunfa_id;

    public int get_id() {
        return _id;
    }

    public void set_id(int _id) {
        this._id = _id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getWx_hao() {
        return wx_hao;
    }

    public void setWx_hao(String wx_hao) {
        this.wx_hao = wx_hao;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getLogo_url() {
        return logo_url;
    }

    public void setLogo_url(String logo_url) {
        this.logo_url = logo_url;
    }

    public String getQr_url() {
        return qr_url;
    }

    public void setQr_url(String qr_url) {
        this.qr_url = qr_url;
    }

    public Date getCreate_time() {
        return create_time;
    }

    public void setCreate_time(Date create_time) {
        this.create_time = create_time;
    }

    public Date getUpdate_time() {
        return update_time;
    }

    public void setUpdate_time(Date update_time) {
        this.update_time = update_time;
    }

    public String getRecent_wz() {
        return recent_wz;
    }

    public void setRecent_wz(String recent_wz) {
        this.recent_wz = recent_wz;
    }

    public Date getRecent_time() {
        return recent_time;
    }

    public void setRecent_time(Date recent_time) {
        this.recent_time = recent_time;
    }

    public String getWz_url() {
        return wz_url;
    }

    public void setWz_url(String wz_url) {
        this.wz_url = wz_url;
    }

    public int getLast_qunfa_id() {
        return last_qunfa_id;
    }

    public void setLast_qunfa_id(int last_qunfa_id) {
        this.last_qunfa_id = last_qunfa_id;
    }


}
