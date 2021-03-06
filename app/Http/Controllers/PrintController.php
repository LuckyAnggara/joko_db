<?php

namespace App\Http\Controllers;

use App\Models\Golongan;
use App\Models\Jabatan;
use App\Models\Pegawai;
use App\Models\Perjadin;
use App\Models\PerjadinRAB;
use App\Models\PerjadinSusunanTim;
use App\Models\SuratPerintah;
//
use App\Models\Bidang;
use App\Models\Kegiatan;
use App\Models\Peran;
use App\Models\Mak;
use App\Models\PerjadinLampiran;
use App\Models\PerjadinLog;
use App\Models\PerjadinObrik;
use App\Models\PerjadinRealisasi;
use App\Models\PerjadinRealisasiLampiran;
use App\Models\PerjadinRealisasiTransport;
use App\Models\PerjadinRealisasiUangHarian;
use App\Models\PerjadinRealisasiUangHotel;
use App\Models\Provinsi;
use App\Models\Realisasi;
use App\Models\Satker;
use App\Models\Tahun;
use App\Models\Urusan;
use App\Models\User;
//
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
use Riskihajar\Terbilang\Facades\Terbilang;
use Symfony\Component\HttpKernel\Event\RequestEvent;

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
        $tim->tujuan = Provinsi::find($tim->provinsi_id)->nama;

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
        $alatangkut = $request->alatangkut;
        $keberangkatan = $tim->perjadin['keberangkatan'];
        $tempat =  $request->tempat;
        $tanggalspd =  $request->tanggal;
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
        $template_document->setValue('tempat', $tempat);
        $template_document->setValue('tanggalspd', $tanggalspd);
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
    function printSpb(Request $request){
        $id = $request->id;
        $tanggal_spb =date_format(date_create($request->tanggal), 'd-F-Y');
        
        $master =  Kegiatan::find($id);
        $master->mak = Mak::find($master->mak_id);

        $master->tahun = Tahun::find($master->tahun_id);
        $master->user = User::find($master->user_id);
        $master->user['pegawai'] = Pegawai::find($master->user['pegawai_id']);
        $master->checker = Pegawai::find($master->checker_id);
        $master->ppk = Pegawai::find($master->ppk_id);
        $master->bendahara = Pegawai::find($master->bendahara_id);

        $template_document = new \PhpOffice\PhpWord\TemplateProcessor(storage_path('app\public\template\template_spb.docx'));
        
        $no_kwitansi = $master->nomor_kwitansi;
        $uraian = $master->uraian;
        $terbilang = Terbilang::make($master->total_realisasi, ' rupiah');
        $mak_kode = $master->mak['kode'];
        $mak_nama = $master->mak['nama'];
        $checker_nama = $master->checker['nama'];
        $bendahara_nama = $master->bendahara['nama'];
        $ppk_nama = $master->ppk['nama'];
        $checker_nip = $master->checker['nip'];
        $bendahara_nip = $master->bendahara['nip'];
        $ppk_nip = $master->ppk['nip'];
        $total_realisasi = "Rp " . number_format($master->total_realisasi,0,',','.');
        $user_nama = $master->user['pegawai']['nama'];
        $user_nip = $master->user['pegawai']['nip'];

        // // // // Replace mark by xml code of table
        $template_document->setValue('tanggal_spb', $tanggal_spb);
        $template_document->setValue('no_kwitansi', $no_kwitansi);
        $template_document->setValue('uraian', $uraian);
        $template_document->setValue('mak_kode', $mak_kode);
        $template_document->setValue('mak_nama', $mak_nama);
        $template_document->setValue('checker_nama', $checker_nama);
        $template_document->setValue('bendahara_nama', $bendahara_nama);
        $template_document->setValue('ppk_nama', $ppk_nama);
        $template_document->setValue('checker_nip', $checker_nip);
        $template_document->setValue('bendahara_nip', $bendahara_nip);
        $template_document->setValue('ppk_nip', $ppk_nip);
        $template_document->setValue('total_realisasi', $total_realisasi);
        $template_document->setValue('terbilang', $terbilang);
        $template_document->setValue('user_nama', $user_nama);
        $template_document->setValue('user_nip', $user_nip);
        // END SET TABLE
        // //save template with table
        $template_document->saveAs(storage_path('app\public\spb\spb.docx'));
        return Storage::disk('public')->download('spb\spb.docx');

        return $master;


    }

    function printRabPerjadin(Request $request){
        $id = $request->id;

        $spreadsheet = new Spreadsheet();
        $sheet = $spreadsheet->getActiveSheet();
        $data = $this->detailPerjadin($id);

        // return $data;

        $sheet->mergeCells('A1:Q1'); // merge
        $sheet->mergeCells('A2:Q2'); // merge
        $sheet->mergeCells('C5:Q5'); // merge
        $sheet->mergeCells('C6:Q6'); // merge
        $sheet->mergeCells('C7:Q7'); // merge
        $sheet->mergeCells('C8:Q8'); // merge
        $sheet->mergeCells('C9:Q9'); // merge
        $sheet->setCellValue('A1', 'RENCANA ANGGARAN PERJALANAN DINAS');
        $sheet->setCellValue('A2', $data->maksud);
        $sheet->getStyle('A1')->getAlignment()->setHorizontal('center');
        $sheet->getStyle('A2')->getAlignment()->setHorizontal('center');


        $sheet->setCellValue('B5', 'Program Aksi');
        $sheet->setCellValue('B6', 'Kegiatan');
        $sheet->setCellValue('B7', 'Maksud Perjalanan Dinas');
        $sheet->setCellValue('B8', 'Pembebanan Anggaran');
        $sheet->setCellValue('B9', 'Output Kegiatan');

        $sheet->setCellValue('C5', ': ');
        $sheet->setCellValue('C6', ': Dukungan Manajemen dan Dukungan Teknis Inspektorat Jenderal');
        $sheet->setCellValue('C7', ': '.$data->maksud);
        $sheet->setCellValue('C8', ': TA '.$data->tahun['nama']);
        $sheet->setCellValue('C9', ': '. $data->output);

        $sheet->getColumnDimension('A')->setAutoSize(true);
        $sheet->getColumnDimension('B')->setAutoSize(true);
        $sheet->getColumnDimension('C')->setAutoSize(true);
        $sheet->getColumnDimension('D')->setAutoSize(true);
        $sheet->getColumnDimension('E')->setAutoSize(true);
        $sheet->getColumnDimension('F')->setAutoSize(true);
        $sheet->getColumnDimension('G')->setAutoSize(true);
        $sheet->getColumnDimension('H')->setAutoSize(true);
        $sheet->getColumnDimension('I')->setAutoSize(true);
        $sheet->getColumnDimension('J')->setAutoSize(true);
        $sheet->getColumnDimension('K')->setAutoSize(true);
        $sheet->getColumnDimension('L')->setAutoSize(true);
        $sheet->getColumnDimension('M')->setAutoSize(true);
        $sheet->getColumnDimension('N')->setAutoSize(true);
        $sheet->getColumnDimension('O')->setAutoSize(true);
        $sheet->getColumnDimension('P')->setAutoSize(true);
        $sheet->getColumnDimension('Q')->setAutoSize(true);

        $sheet->mergeCells('A11:A13'); // merge
        $sheet->mergeCells('B11:B13'); // merge
        $sheet->mergeCells('C11:C13'); // merge
        $sheet->setCellValue('A11', 'NO');
        $sheet->setCellValue('B11', 'NAMA');
        $sheet->setCellValue('C11', 'GOL');
        $sheet->getStyle('A11')->getAlignment()->setVertical('center');
        $sheet->getStyle('B11')->getAlignment()->setVertical('center');
        $sheet->getStyle('C11')->getAlignment()->setVertical('center');


        $sheet->mergeCells('D11:E11'); // merge
        $sheet->mergeCells('F11:G11'); // merge
        $sheet->getStyle('D11')->getAlignment()->setHorizontal('center');
        $sheet->getStyle('E11')->getAlignment()->setHorizontal('center');
        $sheet->setCellValue('D11', 'Kota');
        $sheet->setCellValue('F11', 'Tanggal');
        $sheet->mergeCells('D12:D13'); // merge
        $sheet->mergeCells('E12:E13'); // merge
        $sheet->mergeCells('F12:F13'); // merge
        $sheet->mergeCells('G12:G13'); // merge

        $sheet->setCellValue('D12', 'KEBERANGKATAN');
        $sheet->setCellValue('E12', 'TUJUAN');
        $sheet->setCellValue('F12', 'BERANGKAT');
        $sheet->setCellValue('G12', 'KEMBALI');
        $sheet->getStyle('D12')->getAlignment()->setHorizontal('center');
        $sheet->getStyle('E12')->getAlignment()->setHorizontal('center');
        $sheet->getStyle('F12')->getAlignment()->setHorizontal('center');
        $sheet->getStyle('G12')->getAlignment()->setHorizontal('center');

        $sheet->mergeCells('H11:H13'); // merge
        $sheet->setCellValue('H11', 'JUMLAH HARI');
        $sheet->getStyle('H11')->getAlignment()->setVertical('center');

        $sheet->mergeCells('I11:O11'); // merge
        $sheet->setCellValue('I11', 'JUMLAH / BIAYA (Rp)');
        $sheet->getStyle('I2')->getAlignment()->setHorizontal('center');

        $sheet->mergeCells('I12:I13'); // merge
        $sheet->setCellValue('I12', 'UANG HARIAN');


        $sheet->setCellValue('I13', 'UANG HARIAN');
        $sheet->setCellValue('J13', 'HARI');
        $sheet->setCellValue('K13', 'RP.');
        $sheet->setCellValue('L13', '30%');
        $sheet->setCellValue('M13', 'UDARA');
        $sheet->setCellValue('N13', 'DARAT');
        $sheet->setCellValue('O13', 'LAUT');
        $sheet->setCellValue('P13', 'REPRESENTATIF');
        $sheet->setCellValue('Q13', 'TOTAL');

        $writer = new Xlsx($spreadsheet);
        // $writer->save('hello_world.xlsx');
        $writer->save(storage_path('app\public\print\rab\rab_perjadin.xlsx'));
        return Storage::disk('public')->download('print\rab\rab_perjadin.xlsx');
    }
    function detailPerjadin($id){
        $master = Perjadin::find($id);
        $master->surat_perintah = SuratPerintah::find($master->surat_perintah_id);
        $master->susunan_tim = PerjadinSusunanTim::where('perjadin_id',$master->id)->get();
        $master->mak = Kegiatan::find($master->mak_id);
        $master->tahun = Tahun::find($master->tahun_id);
        // DETAIL SUSUNAN TIM
        foreach ($master->susunan_tim as $key => $tim) {
            $tim->pegawai = Pegawai::find($tim->pegawai_id);
            $tim->anggaran = PerjadinRAB::find($tim->perjadin_rab_id);
            $tim->realisasi = PerjadinRealisasi::find($tim->perjadin_realisasi_id);
            if($tim->realisasi){
                $tim->realisasi['lampiran'] = PerjadinRealisasiLampiran::where('perjadin_realisasi_id', $tim->realisasi['id'])->get();
            }
            $tim->peran = Peran::find($tim->peran_id);
        }

        // DETAIL OBRIK
        $master->obrik = PerjadinObrik::where('perjadin_id',$master->id)->get();

        foreach ($master->obrik as $key => $obrik) {
            $obrik->satker = Satker::find($obrik->satker_id);
            $obrik->urusan = Urusan::find($obrik->urusan_id);
        }

        $master->lampiran = PerjadinLampiran::where('perjadin_id',$master->id)->get();
        foreach ($master->lampiran as $key => $lampiran) {
            $lampiran->pegawai = Pegawai::find(User::find($lampiran->user_id)->pegawai_id);
        }
        $master->bidang = Bidang::find($master->bidang_id);
        $master->user = User::find($master->user_id);
        $master->user['pegawai'] = Pegawai::find($master->user['pegawai_id']);
        $master->log = PerjadinLog::where('perjadin_id',$master->id)->orderBy('id','DESC')->get();
        foreach ($master->log as $key => $log) {
            $log->ago = $log->created_at->diffForHumans();
            $log->pegawai = Pegawai::find($log->user_id);
        }

        return $master;
    }

    function printDOP(Request $request){
        
        $template_document = new \PhpOffice\PhpWord\TemplateProcessor(storage_path('app\public\template\template_dop.docx'));
        $template_document->saveAs(storage_path('app\public\dop\dop.docx'));
        return Storage::disk('public')->download('dop\dop.docx');
    }

    function printDpr(Request $request){
        $id = $request->id;
        $tempat = $request->tempat;
        $tanggal = $request->tanggal;  
        

        $realisasi = PerjadinRealisasi::find($id);
        $realisasi->pegawai = Pegawai::find(PerjadinSusunanTim::find($realisasi->susunan_tim_perjadin_id)->pegawai_id);
        $realisasi->pegawai['jabatan'] = Jabatan::find($realisasi->pegawai['jabatan_id']);
        $realisasi->perjadin = Perjadin::find($realisasi->perjadin_id);
        $realisasi->ppk = Pegawai::find($realisasi->perjadin['ppk_id']);
        $realisasi->surat_perintah = SuratPerintah::find($realisasi->perjadin['surat_perintah_id']);
        $realisasi->uang_harian = PerjadinRealisasiUangHarian::where('perjadin_realisasi_id',$realisasi->id)->get();
        $realisasi->uang_hotel = PerjadinRealisasiUangHotel::where('perjadin_realisasi_id',$realisasi->id)->get();
        $realisasi->transport = PerjadinRealisasiTransport::where('perjadin_realisasi_id',$realisasi->id)->get();

        $riil = [];
        $total_riil = 0;
        $no = 0;
        foreach ($realisasi->uang_harian as $key => $uang_harian) 
        {
            $desc = '';
            if($uang_harian['riil'] === 1){
                $no++;
                $desc = 'Uang Harian sebesar '."Rp " . number_format($uang_harian['uang_harian'],0,',','.'). ' x ' .$uang_harian['jumlah_hari']. ' hari';
                $riil[] = array('no'=>$no, 'desc' =>$desc, 'total' =>  number_format($uang_harian['total'],0,',','.'));
                $total_riil += $uang_harian->total;
            }

        }
        foreach ($realisasi->uang_hotel as $key => $uang_hotel) 
        {
            $desc = '';
            if($uang_hotel['riil'] === 1){
                $no++;
                $desc = 'Uang Hotel sebesar '."Rp " . number_format($uang_hotel['uang_hotel'],0,',','.'). ' x ' .$uang_hotel['jumlah_malam']. ' malam';
                $riil[] = array('no'=>$no,'desc' =>$desc, 'total' =>  number_format($uang_hotel['total'],0,',','.'));
                $total_riil += $uang_hotel->total;
            }

        }
        foreach ($realisasi->transport as $key => $transport) 
        {
            $desc = '';
            if($transport['riil'] === 1){
                $no++;
                $desc = 'Uang Transport '. $transport['jenis_transport'];
                $riil[] = array('no'=>$no,'desc' =>$desc, 'total' =>  number_format($transport['total'],0,',','.'));

                $total_riil += $transport->total;
            }

        }
        $realisasi->riil = $riil;

        $template_document = new \PhpOffice\PhpWord\TemplateProcessor(storage_path('app\public\template\template_pengeluaran_riil.docx'));
        
        $nomor_surat_perintah = $realisasi->surat_perintah['nomor_surat'];
        $tanggal_surat_perintah = $realisasi->surat_perintah['tanggal_surat']->format('d F Y');
       
        $nama = $realisasi->pegawai['nama'];
        $nip = $realisasi->pegawai['nip'];
        $jabatan = $realisasi->pegawai['jabatan']['nama'];

        $nama_ppk= $realisasi->ppk['nama'];
        $nip_ppk = $realisasi->ppk['nip'];

        $values = [
            ['desc' => 1, 'total' => 100000],
            ['desc' => 2, 'total' => 300000],
        ];
        
        // // // // Replace mark by xml code of table
        $template_document->setValue('nomor_surat_perintah', $nomor_surat_perintah);
        $template_document->setValue('tanggal_surat_perintah', $tanggal_surat_perintah);
        $template_document->setValue('total_riil', number_format($total_riil,0,',','.'));
        $template_document->setValue('nama', $nama);
        $template_document->setValue('nip', $nip);
        $template_document->setValue('jabatan', $jabatan);
        $template_document->setValue('nama_ppk', $nama_ppk);
        $template_document->setValue('nip_ppk', $nip_ppk);
        $template_document->setValue('tempat', $tempat);
        $template_document->setValue('tanggal', $tanggal);



        $template_document->cloneRowAndSetValues('no', $realisasi->riil);
  
        // END SET TABLE
        // //save template with table
        $template_document->saveAs(storage_path('app\public\realisasi\dpr\dpr_'.$id.'.docx'));
        return Storage::disk('public')->download('realisasi\dpr\dpr_'.$id.'.docx');
    }

    function printKuitansi(Request $request){
        $id = $request->id;
        // $tanggal = $request->tanggal;
        

        $realisasi = PerjadinRealisasi::find($id);
        $realisasi->pegawai = Pegawai::find(PerjadinSusunanTim::find($realisasi->susunan_tim_perjadin_id)->pegawai_id);
        $realisasi->pegawai['jabatan'] = Jabatan::find($realisasi->pegawai['jabatan_id']);
        $realisasi->perjadin = Perjadin::find($realisasi->perjadin_id);
        $realisasi->perjadin['mak'] = Mak::find($realisasi->perjadin['mak_id']);
        $realisasi->perjadin['tahun'] = Tahun::find($realisasi->perjadin['tahun_id']);
        $realisasi->ppk = Pegawai::find($realisasi->perjadin['ppk_id']);
        $realisasi->bendahara = Pegawai::find($realisasi->perjadin['bendahara_id']);
        $realisasi->surat_perintah = SuratPerintah::find($realisasi->perjadin['surat_perintah_id']);
        $realisasi->uang_harian_data = PerjadinRealisasiUangHarian::where('perjadin_realisasi_id',$realisasi->id)->get();
        $realisasi->uang_hotel_data = PerjadinRealisasiUangHotel::where('perjadin_realisasi_id',$realisasi->id)->get();
        $realisasi->transport_data = PerjadinRealisasiTransport::where('perjadin_realisasi_id',$realisasi->id)->get();


        foreach ($realisasi->transport_data as $key => $transport) {
            $desc = $transport['jenis_transport'];
            $a[] = array('desc_transport' =>$desc, 'total_transport' =>  'Rp.' . number_format($transport['total'],0,',','.')); 
        }
        $realisasi->transport = $a;

        foreach ($realisasi->uang_harian_data as $key => $uang_harian) 
        {
            $desc = $uang_harian['jumlah_hari']. ' hari x Rp ' . number_format($uang_harian['uang_harian'],0,',','.');
            $b[] = array('desc_harian' =>$desc, 'total_harian' => 'Rp.' . number_format($uang_harian['total'],0,',','.'));
        }
        $realisasi->uang_harian = $b;
        foreach ($realisasi->uang_hotel_data as $key => $uang_hotel) 
        {
            $desc = $uang_hotel['jumlah_malam']. ' hari x Rp ' . number_format($uang_hotel['uang_hotel'],0,',','.');
            $c[] = array('desc_hotel' =>$desc, 'total_hotel' => 'Rp.' . number_format($uang_hotel['total'],0,',','.'));
        }
        $realisasi->uang_hotel = $c;

        // return $realisasi;

        $template_document = new \PhpOffice\PhpWord\TemplateProcessor(storage_path('app\public\template\template_kuitansi.docx'));
        
        $template_document->setValue('no_perjadin', $realisasi->perjadin['no_perjadin']);
        $template_document->setValue('kode_mak', $realisasi->perjadin['mak']['kode']);
        $template_document->setValue('tahun', $realisasi->perjadin['tahun']['nama']);
        $template_document->cloneRowAndSetValues('desc_transport', $realisasi->transport);
        $template_document->cloneRowAndSetValues('desc_harian', $realisasi->uang_harian);
        $template_document->cloneRowAndSetValues('desc_hotel', $realisasi->uang_hotel);
        $template_document->setValue('total_realisasi', 'Rp.' . number_format($realisasi->total,0,',','.'));
        $template_document->setValue('terbilang',Terbilang::make($realisasi->total, ' rupiah'));
        $template_document->setValue('no_sppd',$realisasi->surat_perintah['nomor_surat']);
        $template_document->setValue('tanggal_sppd',$realisasi->surat_perintah['tanggal_surat']->format('d F Y'));
        $template_document->setValue('tujuan',$realisasi->perjadin['tujuan']);
        $template_document->setValue('maksud',$realisasi->perjadin['maksud']);
        $template_document->setValue('taksi_jakarta', 'Rp.' . number_format($realisasi->taksi_jakarta,0,',','.'));
        $template_document->setValue('taksi_provinsi', 'Rp.' . number_format($realisasi->taksi_provinsi,0,',','.'));
        $template_document->setValue('total_representatif', 'Rp.' . number_format($realisasi->representatif,0,',','.'));
        $template_document->setValue('nama', $realisasi->pegawai['nama']);
        $template_document->setValue('nip', $realisasi->pegawai['nip']);
        $template_document->setValue('nama_ppk', $realisasi->ppk['nama']);
        $template_document->setValue('nip_ppk', $realisasi->ppk['nip']);
        $template_document->setValue('nama_bendahara', $realisasi->bendahara['nama']);
        $template_document->setValue('nip_bendahara', $realisasi->bendahara['nip']);
        // $template_document->setValue('tanggal', $tanggal);

        $template_document->saveAs(storage_path('app\public\realisasi\kuitansi\kuitansi_'.$id.'.docx'));
        return Storage::disk('public')->download('realisasi\kuitansi\kuitansi_'.$id.'.docx');
    }

    function printSptjm(Request $request){
        $id = $request->id;
        $tanggal = $request->tanggal;
        $tempat = $request->tempat;
        

        $realisasi = PerjadinRealisasi::find($id);
        $realisasi->pegawai = Pegawai::find(PerjadinSusunanTim::find($realisasi->susunan_tim_perjadin_id)->pegawai_id);
        $realisasi->pegawai['jabatan'] = Jabatan::find($realisasi->pegawai['jabatan_id']);
        $realisasi->perjadin = Perjadin::find($realisasi->perjadin_id);
        $realisasi->perjadin['mak'] = Mak::find($realisasi->perjadin['mak_id']);
        $realisasi->perjadin['tahun'] = Tahun::find($realisasi->perjadin['tahun_id']);
        $realisasi->ppk = Pegawai::find($realisasi->perjadin['ppk_id']);
        $realisasi->bendahara = Pegawai::find($realisasi->perjadin['bendahara_id']);
        $realisasi->surat_perintah = SuratPerintah::find($realisasi->perjadin['surat_perintah_id']);

        // return $realisasi;

        $template_document = new \PhpOffice\PhpWord\TemplateProcessor(storage_path('app\public\template\template_sptjm.docx'));
        
        $template_document->setValue('no_sppd',$realisasi->surat_perintah['nomor_surat']);
        $template_document->setValue('tanggal_sppd',$realisasi->surat_perintah['tanggal_surat']->format('d F Y'));
        $template_document->setValue('nama', $realisasi->pegawai['nama']);
        $template_document->setValue('nip', $realisasi->pegawai['nip']);
        $template_document->setValue('jabatan', $realisasi->pegawai['jabatan']['nama']);
        $template_document->setValue('nama_ppk', $realisasi->ppk['nama']);
        $template_document->setValue('nip_ppk', $realisasi->ppk['nip']);
        $template_document->setValue('tempat', $tempat);
        $template_document->setValue('tanggal', $tanggal);

        $template_document->saveAs(storage_path('app\public\realisasi\sptjm\sptjm_'.$id.'.docx'));
        return Storage::disk('public')->download('realisasi\sptjm\sptjm_'.$id.'.docx');
    }
}
