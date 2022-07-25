<?php
/**
 * @name SampleModel
 * @desc sample数据获取类, 可以访问数据库，文件，其它系统等
 * @author root
 */
class HtmlModel {

    protected $type = 'div';
    protected $attributes = array();
    protected $editAttributes = array();
    protected $content = "";
    protected $format = false;
    protected $urlPrefix = "";
    protected $editable = false;

    private $selfClosedTags = array(
        "area",
        "base",
        "br",
        "col",
        "command",
        "embed",
        "hr",
        "img",
        "input",
        "keygen",
        "link",
        "menuitem",
        "meta",
        "param",
        "source",
        "track",
        "wbr"
    );

    public function enableEditable(){
        $this->editable = true;
    }

    public function setUrlPrefix($str){
        $this->urlPrefix = $str;
    }

    public function configsButton(){
        $button ='';

        if($this->editable){
                $button .= '<a href="'.$this->urlPrefix.'updateConfigs/group/website" class="btn btn-outline-danger btn-sm m-1 glightbox" style="color:#e26161"><i class="bi bi-gear"></i> <span class="d-none d-xl-inline-block">设置</span></a>';
        }

        return $button;
    }

    public function wechatButton(){
        $button ='';

        if($this->editable){
                $button .= '<a href="'.$this->urlPrefix.'updateConfigs/group/wechatShare" class="btn btn-outline-danger btn-sm m-1 glightbox" style="color:#e26161"><i class="bi bi-wechat"></i> <span class="d-none d-xl-inline-block">微信</span></a>';
        }

        return $button;
    }

    public function editButton($params){
        $button ='';

        if($this->editable){


            if($params['type']=='updateFields'){
                $button .= '<div class="bd-edit"><a href="'.$this->urlPrefix.$params['type'].'/table/'.$params['table'].'/id/'.$params['id'].'" class="btn-edit glightbox">编辑</a></div>';

            }elseif($params['type']=='list-update-block'){
                $button .= '<div class="bd-edit"><a href="'.$this->urlPrefix.'updateFields/table/'.$params['table'].'/id/'.$params['id'].'" class="btn-edit glightbox">编辑</a><a href="'.$this->urlPrefix.'list/table/'.$params['table'].'" class="btn-list glightbox"><i class="bx bx-list-ul"></i></a></div>';

            }elseif($params['type']=='list'){
                $button .= '<div class="bd-edit"><a href="'.$this->urlPrefix.$params['type'].'/table/'.$params['table'].'/where/'.$params['where'].'" class="btn-edit glightbox">编辑</a></div>';
            }
        }

        

        return $button;
    }

    

    public function tag($type,$attributes=array(),$editAttributes=array(),$content =''){
        $this->type = $type;
        $this->attributes = $attributes;
        $this->editAttributes = $editAttributes;
        $this->content = $content;

        $str = '';

        if(in_array($this->type,$this->selfClosedTags)){
            $str .= $this->selfClosing();
        }
        else{
            $str .= $this->startOpening();
            $str .= '>'.$content;
            $str .= $this->closing();
        }

        return $str;
    }

    private function startOpening(){
        $str = "<".$this->type;

        if($this->editable && sizeof($this->editAttributes)>0){
            if(!isset($this->attributes["class"])){
                $this->attributes["class"] ='';
            }

            if($this->type=="img"){
                $this->attributes["class"] .=" editableimg";
            }elseif ($this->type=="input" && $this->attributes["type"]=="checkbox") {
                $this->attributes["class"] .=" editablecheckbox";

            }else{
                $this->attributes["class"] .=" editable";
            }

            

            foreach($this->editAttributes as $key=>$value){
                $str .= " data-".$key."=\"".(($key=="url")?$this->urlPrefix:'').$value."\"";
            }

        }
        foreach($this->attributes as $key=>$value){
                $str .= " ".$key."=\"".$value."\"";
        }

        if ($this->type=="input" && $this->attributes["type"]=="checkbox" && $this->content =="1") {
             $str .= "value=\"1\"";
             $str .= ($this->content =="1")?"checked":"";
        }

        return $str;
    }

    public function selfClosing(){
        $str = $this->startOpening();
        $str .= "/>";
        return $str;
    }


    public function closing(){
        $str = "</".$this->type.">\n";
        return $str;
    }

    public function _content(){
        $str = "";
        foreach($this->content as $element){
            $a = "$element";
            $lines = explode("\n", $a);
            foreach($lines as $line){
                if(ctype_space($line)){
                    continue;
                }
                if($this->format){
                    $str .= "\n\t";
                }
                $str .= $line;
            }
        }
        return $str;
    }


}
