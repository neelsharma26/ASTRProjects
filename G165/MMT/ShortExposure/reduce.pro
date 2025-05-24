prefix = '/data/bino/reductions/2024.0113/cattarget_14950/'
;prefix = '/data/bino/reductions/2024.0113/cattarget_14950/'

rawdir = prefix + 'crunched/'

sci1  = rawdir + ['sci_img_2024.0113.101719.fits', 'sci_img_2024.0113.103812.fits', 'sci_img_2024.0113.105903.fits']
arc1  = rawdir + ['sci_img_2024.0113.110547.fits']
flat1 = rawdir + ['sci_img_2024.0113.110704.fits', 'sci_img_2024.0113.110820.fits', 'sci_img_2024.0113.110934.fits']
skyflats = []
if n_elements(skyflats) > 0 then skyf1 = rawdir + skyflats

tmpdir  = '/data/bino/reductions/2024.0113/cattarget_14950/' + 'reduced/'
logfile = tmpdir + 'test_logfile.txt'

;; 

binospec_quickreduce, sci1, flat = flat1, arc = arc1, tmpdir = tmpdir, skyflat = skyf1, $
    bright = 1,$         ;; bright targets? 0 = No
    /barycorr,$          ;; perform barycentric correction
    /extract,$           ;; perform extraction
    /extr_opt,$          ;; perform optimal extraction
    extapw = 4,$         ;; FWHM of a Gaussian for optimal extraction (4 = 1arcsec)
    extr_detect = 1, $   ;; detect targets in slits for extraction
    extr_estimate = 0, $ ;; empirically estimate extraction profile (use only for relatively bright targets)
    /split1d, $          ;; write individual files for each extracted 1D spectrum
    /sub_sc_sci, $       ;; mask CCD charge trap regions
    /abscal,$            ;; absolute flux calibration
    oh=1,$            ;; use OH lines to build the wavelength solution
    skysubtarget=1,$      ;; do additional sky subtraction in linearized data
    /skylinecorr, wl_skyline = 630.0304d ;; use sky line to perform illumination correction

cd, 'reduced'
spawn, 'tar -cf obj_counts_1D.tar obj_counts_1D'
spawn, 'tar -cf obj_abs_1D.tar obj_abs_1D'
cd, '..'

exit

