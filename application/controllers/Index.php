<?php

use Medoo\Medoo;

class IndexController extends \Yaf\Controller_Abstract {

	public function init() {
		$this->getConnection();
		$this->_view->mode = "";
	}

    public function getConnection() {
		$DbConf = \Yaf\Registry::get('config')->application->db;
		$this->dbConf = [
		    'database_type' => $DbConf->type,
		    'database_name' => $DbConf->database,
		    'server' => $DbConf->server,
		    'username' => $DbConf->username,
		    'password' => $DbConf->password,
		    'charset' => $DbConf->charset,
		    'port' => $DbConf->port,
		    'option' => [
		        \PDO::ATTR_CASE => \PDO::CASE_NATURAL,
		        \PDO::ATTR_PERSISTENT => true
		    ]
		];
		
		if (!isset($this->dbConnect)) {
		    $this->dbConnect = new Medoo($this->dbConf);
		}
	}

	public function indexAction() {

		$this->_view->html = new HtmlModel();

		//var_dump($this->getRequest()->getQuery('mode'));
		if($this->getRequest()->getQuery('mode')=="admin"){
			$this->_view->mode = "admin";
			$this->_view->html->enableEditable();
			$this->_view->html->setUrlPrefix('/'.strtolower($this->getModuleName()).'/admin/');
		}

		$this->_view->configs = array_reduce(
			$this->dbConnect->select("configs", ['code', 'value']),
			function($temp,$v){
				$temp[$v['code']] = $v['value'];
				return $temp;
			});
			
		$this->_view->menus =  array_tree(
			$this->dbConnect->select("links", "*",["status"=>"1","type"=>"menu","ORDER"=>"orderby"]),
			'parent_id'
			);
		array_orderby($this->_view->menus,'orderby','asc','children');
		
		$this->_view->blocks =  $this->dbConnect->select("blocks", "*",["blocks.status"=>"1","ORDER"=>["blocks.orderby"]]);
		$this->_view->nodes =  $this->dbConnect->select("nodes", "*",["status"=>"1","ORDER"=>"orderby"]);
		
		foreach($this->_view->nodes as $k=>$v){
			$blockNodes[$v["block_id"]][]=$v;
		}
		
		foreach($this->_view->blocks as $k=>$v){
			if(isset($blockNodes[$v["id"]])){
				$this->_view->blocks[$k]['nodes'] = $blockNodes[$v["id"]];
			}
		}
		
		$this->_view->links = $this->dbConnect->select("links", "*",["status"=>"1","type"=>"link","ORDER"=>"orderby"]);
		$this->_view->services = $this->dbConnect->select("links", "*",["status"=>"1","type"=>"service","ORDER"=>"orderby"]);
		
		//var_dump($this->_view->blocks);
		if($this->getRequest()->getQuery('mode')=="export"){

			ob_start();
			$this->getView()->display("index/index.phtml");
			file_put_contents('index.html', ob_get_contents());
			// end buffering and displaying page
			ob_end_flush();

			
			return FALSE;
		}else{
			return TRUE;
		}


        
	}


}
