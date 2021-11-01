<?php

namespace App\Http\Controllers;

use App\Models\Golongan;
use App\Models\Jabatan;
use App\Models\Pegawai;
use App\Models\Perjadin;
use App\Models\PerjadinRAB;
use App\Models\PerjadinSusunanTim;
use App\Models\SuratPerintah;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class PrintController extends Controller
{
    function printSpd(Request $request){
        $id = $request->id;
        $tim = PerjadinSusunanTim::find($id);

        $tim->pegawai = Pegawai::find($tim->pegawai_id);
        $tim->perjadin = Perjadin::find($tim->perjadin_id);
        $tim->perjadin['surat_perintah'] = SuratPerintah::find( $tim->perjadin['surat_perintah_id']);
        $tim->pegawai['golongan'] = Golongan::find($tim->pegawai['golongan_id']);
        $tim->pegawai['jabatan'] = Jabatan::find($tim->pegawai['jabatan_id']);
        $tim->anggaran = PerjadinRAB::find($tim->perjadin_rab_id);

        // return $tim;
       
        // $bulan = $request->input('bulan');
        // $bulanString = date('F', mktime(0, 0, 0, $bulan, 10));
        // $document_with_table = new \PhpOffice\PhpWord\PhpWord();        
        // // // //Open template with ${table}
        $template_document = new \PhpOffice\PhpWord\TemplateProcessor(storage_path('app\public\template\template_spd.docx'));
        
        $no_perjadin = $tim->perjadin['no_perjadin'];
        $no_sp = $tim->perjadin['surat_perintah']['nomor_surat'];
        $nama_ppk = 'JOKO MARTANTO';
        $nip_ppk = '1999999999';
        $nama = $tim->pegawai['nama'];
        $golongan = $tim->pegawai['golongan']['golongan'];
        $pangkat = $tim->pegawai['golongan']['nama'];
        $jabatan = $tim->pegawai['jabatan']['nama'];
        $tingkatbiayapd = 1;
        $maksud = $tim->perjadin['surat_perintah']['perihal'];
        $alatangkut = 'PLANE';
        $keberangkatan = $tim->perjadin['keberangkatan'];
        $tujuan = $tim->perjadin['tujuan'];
        $jumlah_hari = $tim->anggaran['jumlah_hari'] . ' Hari';
        $pegawai_berangkat = date_format(date_create($tim->anggaran['tanggal_berangkat']), 'd-F-Y');
        $pegawai_kembali =date_format(date_create($tim->anggaran['tanggal_kembali']), 'd-F-Y');
        // // // // Replace mark by xml code of table
        $template_document->setValue('no_perjadin', $no_perjadin);
        $template_document->setValue('no_sp', $no_sp);
        $template_document->setValue('nama_ppk', $nama_ppk);
        $template_document->setValue('nip_ppk', $nip_ppk);
        $template_document->setValue('nama', $nama);
        $template_document->setValue('golongan', $golongan);
        $template_document->setValue('pangkat', $pangkat);
        $template_document->setValue('jabatan', $jabatan);
        $template_document->setValue('tingkatbiayapd', $tingkatbiayapd);
        $template_document->setValue('maksud', $maksud);
        $template_document->setValue('alatangkut', $alatangkut);
        $template_document->setValue('keberangkatan', $keberangkatan);
        $template_document->setValue('tujuan', $tujuan);
        $template_document->setValue('jumlah_hari', $jumlah_hari);
        $template_document->setValue('pegawai_berangkat', $pegawai_berangkat);
        $template_document->setValue('pegawai_kembali', $pegawai_kembali);
        // END SET TABLE
        // //save template with table
        $template_document->saveAs(storage_path('app\public\spd\spd_'.$nama.'.docx'));
        return Storage::disk('public')->download('spd\spd_'.$nama.'.docx');
        // return response()->download('spd\spd_'.$nama.'.docx');
        // $mpdf = base_path('vendor/mpdf');
        // $phpWord = \PhpOffice\PhpWord\IOFactory::load(storage_path('app\public\spd\spd_'.$nama.'.docx')); 
        // \PhpOffice\PhpWord\Settings::setPdfRendererPath($mpdf);
        // \PhpOffice\PhpWord\Settings::setPdfRendererName('MPDF');
        // $xmlWriter = \PhpOffice\PhpWord\IOFactory::createWriter($phpWord , 'PDF');
        // $xmlWriter->save(storage_path('app\public\spd\spd_'.$nama.'.pdf')); 
        // return response()->download(storage_path('app\public\spd\spd_'.$nama.'.pdf'));
    }
}
