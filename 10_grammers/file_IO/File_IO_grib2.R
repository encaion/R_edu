# wgrib2 다운로드 사이트
# http://www.ftp.cpc.ncep.noaa.gov/wd51we/wgrib2/
# 해당 사이트에서 OS 버전에 맞게 파일을 다운받음
# 
# 다운받은 wgrib2 관련 파일들을 "C:/Program Files/wgrib2" 에 옮겨준다. 
# (또는 원하는 폴더)

# 변환하고자 하는 grib2 파일을 

# install.packages("rNOMADS")
library("rNOMADS")
Sys.setenv("PATH" = "C:/Program Files/wgrib2") # wgrib2 파일이 있는 경로 지정

info = GribInfo("rww3.2015061500.gb2", file.type = "grib2") # grib 파일 정보 읽어오기
inven_df = data.frame( obs = 1:length(info$inventory),
                       inventory = info$inventory,
                       stringsAsFactors = FALSE)
head(inven_df)

grid = info$grid
head(grid)

install.packages("splitstackshape")
library("splitstackshape")
inven_split = as.data.frame(cSplit(inven_df, splitCols = "inventory", sep = ":"))
head(inven_split)

as.character(unique(inven_split$inventory_6))

inven[1:10]
grid[1:10]

system("wgrib2 rww3.2015061500.gb2 -csv grib2_test_3.csv")
# wgrib2 파일이 rww3.2015061500.gb2 파일을 대상으로 실행됨
# rww3.2015061500.gb2 파일을 csv 파일의 형태로 저장하며 grib2_test_3.csv 라고 저장

# 출력파일의 column 명
# "time0","time1","field","level",longitude,latitude,grid-value
# 출처: http://www.cpc.ncep.noaa.gov/products/wesley/wgrib2/csv.html

library("data.table")
grib_df = fread("grib2_test_3.csv", stringsAsFactors = FALSE, data.table = FALSE)
head(grib_df)

readLines("grib2_test_3.csv", n = 3)

# 어딘가에 떠돌아다니는 예시들...
# wgrib2 -match ":(VGRD|UGRD|TMP): 100mb" weather.grib2 -lon lon1 lat1 -csv csvfile
# system("wgrib2 -s temp.grb | grep :TMP: | wgrib2 -i temp.grb -netcdf TMP.nc",intern=T)

# 또 다른 참고 사이트
# https://bovineaerospace.wordpress.com/category/r/
# http://stackoverflow.com/questions/7622090/how-to-read-grib-files-with-r-gdal

#### wgrib2 의 명령어 목록 ####
# -0xSec           inv  X      Hex dump of section X (0..8)
# -MM              inv         reference time MM
# -N_ens           inv         number of ensemble members
# -RT              inv         type of reference Time
# -S               inv         simple inventory with minutes and seconds (subject to change)
# -Sec0            inv         contents of section0
# -Sec3            inv         contents of section 3 (Grid Definition Section)
# -Sec4            inv         Sec 4 values (Product definition section)
# -Sec5            inv         Sec 5 values (Data representation section)
# -Sec6            inv         show bit-map section
# -Sec_len         inv         length of various grib sections
# -T               inv         reference time YYYYMMDDHHMMSS
# -V               inv         diagnostic output
# -VT              inv         verf time = reference_time + forecast_time (YYYYMMDDHHMMSS)
# -YY              inv         reference time YYYY
# -aerosol_size    inv         optical properties of an aerosol
# -aerosol_wavelength inv         optical properties of an aerosol
# -bitmap          inv         bitmap mode
# -center          inv         center
# -checksum        inv  X      CRC checksum of section X (0..8), whole message (X = -1/message) or (X=data)
# -disc            inv         discipline (code table 0.0)
# -domain          inv         find rectangular domain for g2ctl/GrADS plots
# -end_FT          inv         verf time = reference_time + forecast_time + stat. proc time (YYYYMMDDHHMMSS) (same as -VT)
# -end_ft          inv         verf time = reference_time + forecast_time + stat. proc time (YYYYMMDDHH) (same as -vt)
# -ens             inv         ensemble information
# -ext_name        inv         extended name, var+qualifiers
# -ftime           inv         forecast time
# -full_name       inv         extended name, var+qualifiers
# -gctpc           inv  X       X=0,1 use gctpc library (testing)
# -gdt             inv         contents of Grid Definition Template (g2c)
# -get_byte        inv  X Y Z  get bytes in Section X, location Y (1..N), number of bytes Z (decimal format)
# -get_hex         inv  X Y Z  get bytes in Section X, location Y (1..N), number of bytes Z (bytes in hexadecimal format)
# -get_int         inv  X Y Z  get 4-byte ints in Section X, location Y (byte), number of ints Z
# -grid            inv         grid definition
# -grid_id         inv         show values from grid_id
# -ij              inv  X Y    value of field at grid(X,Y) X=1,..,nx Y=1,..,ny (WxText enabled)
# -ijlat           inv  X Y    lat,lon and grid value at grid(X,Y) X=1,..,nx Y=1,..,ny (WxText enabled)
# -ilat            inv  X      lat,lon and grid value at Xth grid point, X=1,..,npnts (WxText enabled)
# -lev             inv         level (code table 4.5)
# -ll2i            inv  X Y    x=lon y=lat, converts to (i)
# -ll2ij           inv  X Y    x=lon y=lat, converts lon-lat (i,j)
# -lon             inv  X Y    value at grid point nearest lon=X lat=Y (WxText enabled)
# -match_inv       inv         inventory used by -match, -not, -if and -not_if
# -max             inv         print maximum value
# -min             inv         print minimum value
# -misc            inv         variable name qualifiers like chemical, ensemble, probability, etc
# -n               inv         prints out inventory number
# -nl              inv         inserts new line into inventory
# -nl_out          inv  X      write new line in file X
# -nlons           inv         number of longitudes for each latitude
# -npts            inv         number of grid points
# -nxny            inv         nx and ny of grid
# -packing         inv         shows the packing mode (use -v for more details)
# -print           inv  X      inserts string into inventory
# -prob            inv         probability information
# -process         inv         Process (code table 4.3)
# -processid       inv         process id (locally defined)
# -proj4_ij2ll     inv  X Y    X=x Y=y, converts to (i,j) to lon-lat using proj.4 (experimental)
# -proj4_ll2i      inv  X Y    x=lon y=lat, converts to (i) using proj.4 (experimental)
# -proj4_ll2ij     inv  X Y    x=lon y=lat, converts lon-lat (i,j) using proj.4 (experimental)
# -range           inv         print out location of record in bytes, 0 = first byte
# -s               inv         simple inventory
# -scale           inv         scale for packing
# -scaling         inv         scaling for packing (old format)
# -scan            inv         scan order of grid
# -spatial_proc    inv         show spacial processing, pdt=4.15
# -spectral        inv         show spectral bands
# -spectral_bands  inv         spectral bands for satellite, pdt=4.31
# -start_FT        inv         verf time = reference_time + forecast_time (YYYYMMDDHHMMSS) - no stat. proc time
# -start_ft        inv         verf time = reference_time + forecast_time (YYYYMMDDHH) : no stat. proc time
# -stats           inv         statistical summary of data values
# -subcenter       inv         subcenter
# -t               inv         reference time YYYYMMDDHH, -v2 for alt format
# -table           inv         parameter table
# -unix_time       inv         print unix timestamp for rt & vt
# -var             inv         short variable name
# -varX            inv         raw variable name - discipline mastertab localtab center parmcat parmnum
# -vector_dir      inv         grid or earth relative winds
# -verf            inv         simple inventory using verification time
# -vt              inv         verf time = reference_time + forecast_time, -v2 for alt format
# -wave_partition  inv         ocean surface wave partition (pdt=52)
# -s_out           inv> X      simple inventory written to X
# -big_endian      misc        sets ieee output to big endian (default is big endian)
# -colon           misc X      replace item deliminator (:) with X
# -config          misc        shows the configuration
# -count           misc        prints number of fields
# -end             misc        stop after first (sub)message (save time)
# -fix_CFSv2_fcst  misc X Y Z  fixes CFSv2 monthly fcst X=daily or 00/06/12/18 Y=pert no. Z=number ens fcsts v1.0
# -fix_ncep        misc        fix ncep PDT=8 headers produced by cnvgrib
# -grid_changes    misc        prints number of grid changes
# -grid_def        misc        read lon and lat data from grib file -- experimental
# -h               misc        help, shows common options
# -header          misc        f77 header or nx-ny header in text output (default)
# -help            misc X      help [search string|all], -help all, shows all options
# -if              misc X      if X (POSIX regular expression) matches, conditional execution up to next output/fi
# -if_n            misc X      if (inv numbers in range), X=(start:end:step)
# -if_rec          misc X      if (record numbers in range), X=(start:end:step)
# -if_reg          misc X      if rpn registers defined, X = A, A:B, A:B:C, etc A = register number
# -ijundefine      misc X Y Z  sets grid point values to undefined X=(in-box|out-box) Y=ix0:ix1 Z=iy0:iy1 ix=(1..nx) iy=(1..ny)
# -import_bin      misc X      read binary file (X) for data
# -import_ieee     misc X      read ieee file (X) for data
# -import_text     misc X      read text file (X) for data
# -inv             misc X      write inventory to X
# -limit           misc X      stops after X fields decoded
# -little_endian   misc        sets ieee output to little endian (default is big endian)
# -new_grid_interpolation misc X      new_grid interpolation X=bilinear,bicubic,neighbor,budget
# -new_grid_ipopt  misc X      new_grid ipopt values X=i1:i2..:iN N <= 20
# -new_grid_vectors misc X      change fields to vector interpolate: X=none,default,UGRD:VGRD
# -new_grid_winds  misc X      new_grid wind orientation: X = grid, earth (N/S, default) -- alpha
# -no_header       misc        no f77 header or nx-ny header in text output
# -not_if          misc X      if not X (regular expression) matches, conditional execution until next output/fi
# -rpn             misc X      reverse polish notation calculator (beta)
# -set             misc X Y    set X = Y, X=local_table,etc (help: -set help help)
# -set_ave         misc X      set ave/acc .. only on pdt=4.0 only anl/fcst
# -set_bin_prec    misc X      X set number of binary bits for grib_out packing
# -set_byte        misc X Y Z  set bytes in Section X, location Y (1..N), bytes Z (a|a:b:c)
# -set_date        misc X      changes date code .. keep old date code if not specified completely
# -set_ens_num     misc X Y Z  convert PDT 0,1 -> 1, 8,11 -> 11, X=code table 4.6 Y=pert num Z=num ens members
# -set_ensm_derived_fcst misc X Y    convert PDT 0,1,2 -> 2, 8,11,12 -> 12, X=code table 4.7 Y=num ens members
# -set_ftime       misc X      set ftime .. only on pdt=4.0 only anl/fcst
# -set_grib_max_bits misc X      sets scaling so number of bits does not exceed N in (new) grib output
# -set_grib_type   misc X      set grib type = jpeg, simple, ieee, complex(1|2|3), same
# -set_hex         misc X Y Z  set bytes in Section X, location Y (1..N), bytes Z (a|a:b:c) in hexadecimal
# -set_ijval       misc X Y Z  sets grid point value X=ix Y=iy Z=val
# -set_int         misc X Y Z  set 4-byte ints in Section X, location Y (1..N), signed integers Z (a|a:b:c)
# -set_lev         misc X      changes level code .. not complete
# -set_metadata    misc X      read meta-data for grib writing from file X
# -set_pdt         misc X      makes new (clean) pdt, X=PDT_number or X=PDT_number:size of PDT in octets
# -set_scaling     misc X Y    set decimal scaling=X binary scaling=Y for grib_out packing
# -set_sec_size    misc X Y    resizes section , X=section number, Y=size in octets, DANGEROUS
# -set_ts_dates    misc X Y Z  changes date code for time series X=YYYYMMDDHH(mmss) Y=dtime Z=#msgs/date
#   -set_var         misc X      changes variable name
# -submsg          misc X      process submessage X (0=process all messages)
# -sys             misc X      run system/shell command, X=shell command
# -text_col        misc X      number of columns on text output
# -text_fmt        misc X      format for text output (C)
# -udf             misc X Y    run UDF, X=program+optional_args, Y=return file
# -udf_arg         misc X Y    add grib-data to UDF argument file, X=file Y=name
# -undefine        misc X Y Z  sets grid point values to undefined X=(in-box|out-box) Y=lon0:lon1 Z=lat0:lat1
# -undefine_val    misc X      grid point set to undefined if X=val or X=low:high
# -v               misc        verbose (v=1)
# -v0              misc        not verbose (v=0)
# -v2              misc        really verbose (v=2)
# -version         misc        print version
# -AAIG            out         writes Ascii ArcInfo Grid file, lat-lon grid only (alpha)
# -GRIB            out  X      writes entire GRIB record (all submessages)
# -ave             out  X Y    average X=time step, Y=output grib file needs file is special order
# -bin             out  X      write binary data to X
# -cress_lola      out  X..Z,A lon-lat grid values X=lon0:nlon:dlon Y=lat0:nlat:dlat Z=file A=radius1:radius2:..:radiusN
# -csv             out  X      make comma separated file, X=file (WxText enabled)
# -fcst_ave        out  X Y    average X=time step, Y=output grib file needs file is special order
# -fi              out         null output operation
# -grib            out  X      writes GRIB record (one submessage) to X
# -grib_ieee       out  X      writes data[] to X.grb, X.head, X.tail, and X.h
# -grib_out        out  X      writes decoded/modified data in grib-2 format to file X
# -grib_out_irr    out  X Y    writes irregular grid grib X=(all|defined) Y=(output file)
# -ieee            out  X      write (default:big-endian) IEEE data to X
# -ijbox           out  X..Z,A grid values in bounding box X=i1:i2[:di] Y=j1:j2[:dj] Z=file A=[bin|text|spread]
# -ijsmall_grib    out  X Y Z  make small domain grib file X=ix0:ix1 Y=iy0:iy1 Z=file (beta)
# -irr_grid        out  X Y Z  make irregular grid, nearest neighbor, X=lon-lat list Y=radius (km) Z=output grib file
# -lola            out  X..Z,A lon-lat grid values X=lon0:nlon:dlon Y=lat0:nlat:dlat Z=file A=[bin|text|spread|grib]
# -merge_fcst      out  X Y    normalize NCEP-type ave/acc X=number Y=output grib file
# -mysql           out  5 args H=[host] U=[user] P=[password] D=[db] T=[table] (alpha)
# -mysql_dump      out  7 args H=[host] U=[user] P=[password] D=[db] T=[table] W=[western_lons:0|1] PV=[remove unlikely:0|1]
# -mysql_speed     out  7 args H=[host] U=[user] P=[password] D=[db] T=[table] W=[western_lons:0|1] PV=[remove unlikely:0|1]
# -ncep_norm       out  X      normalize NCEP-type ave/acc X=output grib file
# -ncep_uv         out  X      combine U and V fields into one message like NCEP operations
# -netcdf          out  X      write netcdf data to X
# -new_grid        out  X..Z,A bilinear interpolate: X=projection Y=x0:nx:dx Z=y0:ny:dy A=grib_file alpha
# -small_grib      out  X Y Z  make small domain grib file X=lonW:lonE Y=latS:latN Z=file (beta)
# -spread          out  X      write text - spread sheet format into X (WxText enabled)
# -text            out  X      write text data into X
# -tosubmsg        out  X      convert GRIB message to submessage and write to file X
# -wind_dir        out  X      calculate wind direction, X = output gribfile (direction in degrees, 0=wind from north, 90=wind from east)
# -wind_speed      out  X      calculate wind speed, X = output gribfile (U then V in datafile)
# -append          init        append mode, write to existing output files
# -crlf            init        make the end of the inventory a crlf (windows) instead of newline (unix)
# -d               init X      dump message X (n or n.m), only 1 -d allowed
# -eof_bin         init X Y    send (binary) integer to file upon EOF: X=file Y=integer
# -eof_string      init X Y    send string to file upon EOF: X=file Y=string
# -err_bin         init X Y    send (binary) integer to file upon err exit: X=file Y=integer
# -err_string      init X Y    send string to file upon err exit: X=file Y=string
# -fix_ncep_2      init        ncep bug fix 2, probability observation < -ve number
# -fix_ncep_3      init        sets flag to fix ncep bug 3 (constant fields)
# -fix_ncep_4      init        fixes NCEP grib2 files where DX and DY are undefined
# -for             init X      process record numbers in range, X=(start:end:step), only one -for allowed
# -for_n           init X      process inv numbers in range, X=(start:end:step), only one -for allowed
# -g2clib          init X      X=0/1/2 0=WMO std 1=emulate g2clib 2=use g2clib
# -i               init        read Inventory from stdin
# -match           init X      process data that matches X (POSIX regular expression)
# -nc3             init        use netcdf3 (classic)
# -nc4             init        use netcdf4 (compressed, controlled endianness etc)
# -nc_grads        init        require netcdf file to be grads v1.9b4 compatible (fixed time step only)
# -nc_nlev         init X      netcdf, X = max LEV dimension for {TIME,LEV,LAT,LON} data
# -nc_pack         init X      pack/check limits of all NEW input variables, X=min:max[:byte|short|float]
# -nc_table        init X      X is conversion_to_netcdf_table file name
# -nc_time         init X      netcdf, [[-]yyyymmddhhnnss]:[dt{s[ec]|m[in]|h[our]|d[ay]}], [-] is for time alignment only
# -ncpu            init X      number of threads, default is environment variable OMP_NUM_THREADS/number of cpus
# -no_append       init        not append mode, write to new output files (default)
# -no_nc_grads     init        netcdf file may be not grads v1.9b4 compatible, variable time step
# -no_nc_pack      init        no packing in netcdf for NEW variables
# -no_nc_table     init        disable previously defined conversion_to_netcdf_table
# -no_nc_time      init        netcdf, disable previously defined initial or relative date and time step
# -not             init X      process data that does not match X (POSIX regular expression)
# -one_line        init        puts all on one line (makes into inventory format)
# -order           init X      decoded data in X (raw|we:sn|we:ns) order, we:sn is default
# -set_ext_name    init X      X=0/1 extended name on/off
# -set_regex       init X      set regex mode X = 0:extended regex (default) 1:pattern 2:extended regex & quote metacharacters
# -tigge           init        use modified-TIGGE grib table
