def flam_to_ab(flux, wavelength):
    ab_mag = []
    f_nu = []

    for n in range(0, len(y), 1):
        conversion = (((wavelength[n])**2)/(3e18)) * flux[n]
        f_nu.append(conversion)

    print('F𝜈:')
    print(f_nu)

    for n in range(0, len(f_nu), 1):
        if float(f_nu[n]) != 0:
            AB = (-2.5 * np.log10(float(f_nu[n]))) - 48.6
            ab_mag.append(float(AB))
        else:
            ab_mag.append(0)

    return ab_mag
