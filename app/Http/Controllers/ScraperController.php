<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Goutte\Client;

class ScraperController extends Controller
{

    public function getUpt()
    {

        $client = new Client();

        $website = $client->request('GET', 'https://elembaga.kemenkumham.go.id/index.php/satker/upt?page=150');

        return $website;
    }
}
